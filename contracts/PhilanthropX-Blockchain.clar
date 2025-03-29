;; PhilanthropX - A blockchain-powered system enabling progressive resource allocation
;; This contract establishes a secure, milestone-based asset transfer mechanism
;; with built-in accountability and protection measures on the Stacks blockchain.
;; Built with Clarity 2.0

;; Core configuration parameters
(define-constant OVERSEER tx-sender)
(define-constant ERROR_ACCESS_DENIED (err u200))
(define-constant ERROR_RESOURCE_NOT_FOUND (err u201))
(define-constant ERROR_ASSETS_ALREADY_DISBURSED (err u202))
(define-constant ERROR_ASSET_TRANSFER_FAILED (err u203))
(define-constant ERROR_INVALID_ALLOCATION_ID (err u204))
(define-constant ERROR_INVALID_ASSET_QUANTITY (err u205))
(define-constant ERROR_INVALID_ACHIEVEMENT (err u206))
(define-constant ERROR_ALLOCATION_LAPSED (err u207))
(define-constant ALLOCATION_LIFESPAN u1008) ;; ~7 days in blocks

;; Security and protection parameters
(define-constant SYSTEM_COOLDOWN_PERIOD u720) ;; ~5 days in blocks
(define-constant ERROR_PROTECTION_SYSTEM_ACTIVE (err u222))
(define-constant ERROR_PROTECTION_TRIGGER_COOLDOWN (err u223))
(define-constant MAX_BENEFICIARIES u5)
(define-constant ERROR_BENEFICIARY_LIMIT_EXCEEDED (err u224))
(define-constant ERROR_INVALID_ASSET_DISTRIBUTION (err u225))
(define-constant ERROR_ALREADY_LAPSED (err u208))
(define-constant MAX_EXTENSION_TIME u1008) ;; ~7 days in blocks
(define-constant ERROR_ENHANCEMENT_ALREADY_RECORDED (err u210))
(define-constant ERROR_DELEGATION_EXISTS (err u211))
(define-constant ERROR_BATCH_PROCESSING_FAILED (err u212))
(define-constant ERROR_VELOCITY_LIMIT_EXCEEDED (err u213))
(define-constant VELOCITY_WINDOW u144) ;; ~24 hours in blocks
(define-constant MAX_ALLOCATIONS_PER_WINDOW u5)
(define-constant ERROR_ANOMALOUS_ACTIVITY (err u215))
(define-constant ANOMALOUS_QUANTITY_THRESHOLD u1000000000) ;; Large allocation threshold
(define-constant ANOMALOUS_VELOCITY_THRESHOLD u3) ;; Number of rapid allocations that trigger anomaly detection
(define-constant ERROR_REVIEW_EXISTS (err u236))
(define-constant ERROR_REVIEW_PERIOD_ENDED (err u237))
(define-constant REVIEW_TIMEFRAME u1008) 
(define-constant REVIEW_STAKE u1000000) ;; 1 STX stake for reviews

;; Persistent storage structures
(define-map ResourceAllocations
  { allocation-id: uint }
  {
    provider: principal,
    beneficiary: principal,
    quantity: uint,
    state: (string-ascii 10),
    initialized-at: uint,
    expires-at: uint,
    achievements: (list 5 uint),
    validated-achievements: uint
  }
)
