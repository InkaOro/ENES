export const initButtonBar = () => {
  const bar = document.querySelector('.bottom-button-bar');
  const footer = document.querySelector('.footer');

  if (!bar) { return; }

  function getOffset(el) {
    const rect = el.getBoundingClientRect();
    return {
      left: rect.left + window.scrollX,
      top: rect.top + window.scrollY
    };
  }

  const checkOffset = () => {
    console.log(getOffset(bar).top + bar.clientHeight >= getOffset(footer).top);

    if (getOffset(bar).top + bar.clientHeight >= getOffset(footer).top) {
      console.log('STOP!!!!');
      bar.style.left = 0;
      bar.style.position = 'absolute';
    } else {
      console.log('NICE');
      bar.style.position = 'fixed';
    }

    // if (window.scrollY + window.innerHeight < footer.offsetTop) {
    //   bar.style.position = 'fixed';
    // }
  }

  document.addEventListener('scroll', () => {
    checkOffset();
  });
}
