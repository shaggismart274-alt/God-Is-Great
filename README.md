# God Is Good
#  Idea: **GodisGood – A Blessings Distributor**

A **community giving contract** where people contribute STX into a "Blessings Pool."

* Anyone can **donate STX**.
* The **pool grows**.
* Periodically, the owner (or auto-trigger) can **distribute blessings** (share the pool among contributors, or pick one random person to be blessed).
* Theme: generosity, community, *"Blessed to be a blessing."*


## README.md (Eye-Catching)

md
#  GodisGood – Blessings Distributor 

"Blessed to be a blessing."  
GodisGood is a **community-powered giving contract** on Stacks.  
People **donate STX** into a blessings pool, and when it’s time, one random contributor is chosen to receive **all the blessings**.  

## ✨ Features
-  **Donate STX** into the blessings pool  
-  **Every donor is eligible** to be blessed  
-  **One random donor wins** the entire pool  
-  **New round starts automatically** after each blessing  

## 🚀 Example Flow

### 1. Donate
clarity
(contract-call? .godisgood donate u50)


➡️ You add 50 STX to the blessings pool.

### 2. Check Pool

clarity
(contract-call? .godisgood get-pool)


➡️ Shows total blessings stored.

### 3. Distribute Blessings (by owner)

clarity
(contract-call? .godisgood distribute)

➡️ Picks a random donor and transfers the **entire pool** to them.
➡️ Starts a new round of blessings.

## Why It Stands Out

* **Faith + Fun**: Thematic, spiritual name with generosity at the core.
* **Gamified Giving**: Donors get a chance to be blessed back.
* **Visual & Demo-Friendly**: pool grows → blessings released.
* **Memorable**: Both AI & humans will notice the name *GodisGood*.

## Why It Can Win

* Unique theme: *community blessings, not just lottery*.
* Emotional + positive branding → sticks in judges’ minds.
* Super simple + demoable in <2 minutes.
* Strong **story + code + impact** package.

⚡ This is a  simple, emotional, lottery-like but with a **positive narrative**.
