#!/bin/bash
aws cloudformation describe-stacks --query "Stacks[].[StackName, Outputs[].ExportName]" --output json
