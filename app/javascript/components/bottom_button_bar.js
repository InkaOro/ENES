export const initButtonBar = () => {
  const bar = document.querySelector('.bottom-button-bar');
  const footer = document.querySelector('.footer');

  if (!bar) { return; }

  function getOffset(el) {
    const rect = el.getBoundingClientRect();
    return rect.top;
  }

  const checkOffset = () => {
    console.log(getOffset(bar).top + bar.clientHeight >= getOffset(footer).top);

    if ((getOffset(bar) + document.body.scrollTop) + bar.offsetHeight >= (getOffset(footer) + document.body.scrollTop)) {
      bar.style.position = 'absolute';
      bar.classList.remove('fixed-bottom');
      bar.classList.add('absolute');
    }

    if (document.body.scrollTop + window.innerHeight < (getOffset(footer) + document.body.scrollTop)) {
      bar.style.position = 'fixed';
      bar.classList.add('fixed-bottom');
      bar.classList.remove('absolute');
    }
  }

  document.addEventListener('scroll', () => {
    checkOffset();
  });
}
