requires 'perl', '5.006';

on configure => sub {
    requires 'Module::Build';
    requires 'perl', '5.008_001';
};

on test => sub {
    requires 'Test::More';
};
