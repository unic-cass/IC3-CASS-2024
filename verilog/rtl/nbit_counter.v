module nbit_counter(
    input wire clk,
    input wire rst,
    input wire in,
    output reg finalbit
);

    reg [4:0] count1; // Counter for 1s
    reg [4:0] count0; // Counter for 0s
    reg fl; // Flag for enabling counting

    // Initialize counters and flag on reset
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            fl <= 1'b0;
            count0 <= 5'd0;
            count1 <= 5'd0;
            finalbit <= 1'b0;
        end else begin
            // Set the flag when 'in' becomes 1
            if (in && !fl) begin
                fl <= 1'b1;
            end
            
            // Counting logic based on 'fl' flag
            if (fl) begin
                if (in) begin
                    count1 <= count1 + 1;
                end else begin
                    count0 <= count0 + 1;
                end
                
                // Check if total count of 1s and 0s reaches 17
                if (count1 + count0 == 5'b10001) begin
                    finalbit <= (count1 > count0) ? 1'b1 : 1'b0;
                    count1 <= 5'b00000;
                    count0 <= 5'b00000;
                    fl <= 1'b0; // Reset flag after comparison
                end
            end
        end
    end

endmodule
