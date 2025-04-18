package s380f.gp.s380f.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.LoginUrlAuthenticationEntryPoint;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import static org.springframework.security.config.Customizer.withDefaults;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

        @Bean
        public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
                http
                                .csrf(csrf -> csrf.disable())
                                .authorizeHttpRequests(authorize -> authorize
                                                .requestMatchers("/student/**").hasAnyRole("STUDENT", "TEACHER")
                                                .requestMatchers("/teacher/**").hasAnyRole("TEACHER")
                                                .anyRequest().permitAll())
                                .exceptionHandling(exception -> exception
                                                .authenticationEntryPoint(
                                                                new LoginUrlAuthenticationEntryPoint("/index"))
                                                .accessDeniedHandler((request, response, accessDeniedException) -> {
                                                        response.sendRedirect("/index");
                                                }))
                                .formLogin(form -> form
                                                .loginPage("/login")
                                                .loginProcessingUrl("/login")
                                                .permitAll())
                                .logout(logout -> logout
                                                .logoutUrl("/logout")
                                                .logoutSuccessUrl("/")
                                                .permitAll()

                                )
                // .rememberMe(rememberMe -> rememberMe
                // .key("uniqueAndSecret") // use a unique key
                // .rememberMeParameter("remember-me")
                // .tokenValiditySeconds(86400))
                ;
                return http.build();
        }
}