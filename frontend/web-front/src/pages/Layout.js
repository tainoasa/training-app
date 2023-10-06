import React from 'react'
import Navigation from './Navigation';

const Layout = ( {children} ) => {
  return (
    <>
        <Navigation />
        {children}
        <footer>Copyright © 2023 Team-Tokumori.</footer>
    </>
  )
}
export default Layout