function createLoginTracker(userInfo) {

  let attemptCount = 0;

  const loginAttempt = (passwordAttempt) => {

    // If already exceeded max attempts (3 failed attempts), lock account
    if (attemptCount >= 3) {
      return "Account locked due to too many failed login attempts";
    }

    // Increment attempt count
    attemptCount++;

    // Check if password is correct
    if (passwordAttempt === userInfo.password) {
      return "Login successful";
    }

    // Return failed attempt message
    return `Attempt ${attemptCount}: Login failed`;
  };

  return loginAttempt;
}

module.exports = { createLoginTracker };
