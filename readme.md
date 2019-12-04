Code and experimental data for the paper:

A. Cropper and S. Tourret. Logical minimisation of metarules. Machine learning (accepted).

To reproduce the experiment results, cd to the relevant directory.

To regenerate training and testing data, run 'python runner.py gen'

To rerun the testing step, run 'python runner.py test'

To rerun the learning step, run 'python runner.py learn'

To regenerate the results run 'python runner.py results'

Please note that the results in this directory match those in the paper and were generated using YAP.
However, YAP is now quite unstable and is difficult to install on many operating systems.
Therefore, we have rewritten the code to make the results (mostly) reproducible.
The predictive accuracies should not vary much.
The learning times may, however, increase, because SWIPL is about 4X slower than YAP.
However, the focus of the experiments is to compare learning times, so their absolute value is of little importance.