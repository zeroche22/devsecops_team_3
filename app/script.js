const form = document.querySelector('.login-form');
const passwordInput = document.getElementById('password');
const togglePasswordButton = document.querySelector('.toggle-password');
const toast = document.querySelector('.status-toast');

const showToast = (message) => {
  toast.textContent = message;
  toast.classList.add('visible');

  window.clearTimeout(showToast.timeoutId);
  showToast.timeoutId = window.setTimeout(() => {
    toast.classList.remove('visible');
  }, 1800);
};

if (togglePasswordButton && passwordInput) {
  togglePasswordButton.addEventListener('click', () => {
    const isPassword = passwordInput.type === 'password';
    passwordInput.type = isPassword ? 'text' : 'password';
    togglePasswordButton.setAttribute('aria-pressed', String(isPassword));
    togglePasswordButton.innerHTML = `<span>${isPassword ? 'Сховати' : 'Показати'}</span>`;
  });
}

if (form) {
  form.addEventListener('submit', (event) => {
    event.preventDefault();
    showToast('Це демо-форма: реальний вхід вимкнено');
  });
}
