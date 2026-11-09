/*
 * Copyright (c) 2024 Nguyen Phuong Binh
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_example (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // power enable
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // Mạch cổng AND kết hợp 2 tín hiệu đầu vào ui_in[0] và ui_in[1]
  assign uo_out[0] = ui_in[0] & ui_in[1];

  // Gán các chân ngõ ra còn lại bằng 0
  assign uo_out[7:1] = 7'b0;
  assign uio_out     = 8'b0;
  assign uio_oe      = 8'b0;

  // Khai báo các tín hiệu không dùng tới để tránh cảnh báo (warning) khi tổng hợp
  wire _unused = &{ena, clk, rst_n, ui_in[7:2], uio_in, 1'b0};

endmodule
