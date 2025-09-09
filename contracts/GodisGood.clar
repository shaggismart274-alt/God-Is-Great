;; contracts/godisgood.clar
;; GodisGood - Blessings Distributor
;; A community giving pool where people donate STX,
;; and one contributor is randomly blessed with the jackpot.

(define-data-var pool-balance uint u0)
(define-data-var contribution-count uint u0)
(define-data-var round-id uint u0)

(define-map contributions
  { round: uint, id: uint }
  { contributor: principal, amount: uint }
)

(define-constant ERR-NO-CONTRIBUTIONS u100)
(define-constant ERR-NOT-OWNER u101)

(define-data-var contract-owner principal tx-sender)

;;  Donate into blessings pool
(define-public (donate (amount uint))
  (begin
    (as-contract (stx-transfer? amount tx-sender (contract-caller)))
    (let ((id (+ u1 (var-get contribution-count))))
      (var-set contribution-count id)
      (map-set contributions { round: (var-get round-id), id: id }
        { contributor: tx-sender, amount: amount })
      (var-set pool-balance (+ (var-get pool-balance) amount))
      (ok id)
    )
  )
)

;; Distribute blessings (pick random contributor)
(define-public (distribute)
  (begin
    (asserts! (is-eq tx-sender (var-get contract-owner)) (err ERR-NOT-OWNER))
    (asserts! (> (var-get contribution-count) u0) (err ERR-NO-CONTRIBUTIONS))

    (let (
      (winner-id (+ u1 (mod block-height (var-get contribution-count))))
      (pot (var-get pool-balance))
      (winner (unwrap-panic (map-get? contributions { round: (var-get round-id), id: winner-id })))
    )
      (begin
        ;; Bless the winner 
        (as-contract (stx-transfer? pot (contract-caller) (get contributor winner)))
        ;; reset for next round
        (var-set pool-balance u0)
        (var-set contribution-count u0)
        (var-set round-id (+ u1 (var-get round-id)))
        (ok (get contributor winner))
      )
    )
  )
)

;; --- Views ---
(define-read-only (get-pool) (var-get pool-balance))
(define-read-only (get-contribution (round uint) (id uint)) (map-get? contributions { round: round, id: id }))
(define-read-only (get-round) (var-get round-id))
