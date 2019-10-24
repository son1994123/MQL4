<?php 

public function is_localhost() {
             if ( current_user_can( 'manage_options' ) ) {
                              $current_sessions = wp_get_all_sessions();
                                $whitelist = array(
                                                                '127.0.0.1',
                                                                'localhost',
                                                                '::1',
                                                                'ncna.vn',
                                                        );
                if ( isset( $current_sessions[0] ) && isset( $current_sessions[0]['ip'] ) && in_array( $current_sessions[0]['ip'], $whitelist ) ) {
                                     return true;
                            }
                                                            }
                                return true;
                                }
?>
3630256e-ff04-474d-bea4-fba62157c621

