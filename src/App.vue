<template>
  <div id="app">
    <nav>
      <router-link to="/">Home</router-link>
      <router-link to="/about">About</router-link>
      <router-link to="/contact">Contact</router-link>
    </nav>
    <main>
      <router-view />
    </main>
  </div>
</template>

<style>
nav {
  background: #333;
  padding: 1rem;
}
nav a {
  color: white;
  margin-right: 1rem;
  text-decoration: none;
}
</style>
