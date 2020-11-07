function COMP = compdct(x)
[M N] = size(x);
COMP = [];
mx = 1:8;
mc = 1:4;
for i = 1:floor(M/8),
   nx = 1:8;
   nc = 1:4;
   for j = 1:floor(N/8),
      FRAG = dct2(x(mx,nx));
      COMP(mc,nc) = FRAG(1:4,1:4);
      nx = nx+8;
      nc = nc+4;
   end
   mx = mx+8;
   mc = mc+4;
end
