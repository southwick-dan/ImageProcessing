function out = mydct (block, tau)
    dct = dct2(block);
    dct(abs(dct) < tau) = 0;
    out = idct2(dct);
end