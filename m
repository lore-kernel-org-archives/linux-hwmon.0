Return-Path: <SRS0=9kW7=DA=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5981C4363D
	for <linux-hwmon@archiver.kernel.org>; Wed, 23 Sep 2020 14:15:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A8A3920639
	for <linux-hwmon@archiver.kernel.org>; Wed, 23 Sep 2020 14:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600870535;
	bh=WLo7iw135GAzrwWL+0tfzUVfPGzMaEputrHdzackpaE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=XgReoMtGvo9TU6AvfjIRF7K+iPdTWPBflXhmP5coZCQriYB1F7TC9Br4t6R1lZYlr
	 8zRslUoni0GCuwDdn4VWJxE1lqRcj9XhF/E74990CTidg75bSpRv+bG5xzjWcTa8mi
	 4uom81PtuJ7geBqPmtctw/P9pUA4MemHIIg3zBFA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726688AbgIWOPf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 23 Sep 2020 10:15:35 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:34235 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgIWOPf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 23 Sep 2020 10:15:35 -0400
Received: by mail-il1-f193.google.com with SMTP id q5so14435118ilj.1;
        Wed, 23 Sep 2020 07:15:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=z+ybPwbaro6Mbg51vI4gLj1KNI6OKly684zYKEE/3qs=;
        b=ZOr2Rx0g/C2OhSbvbJ3EiNZIozSOQfKNXCy9S6Gd+XWmBqgW9Lnr9LNjHu6gHi/rhk
         frC6BhzThElCqOzKONn0/RJRgWJI6hwwRxKYOnEqgn6T3XKVEynnK0xDJHjjp8NmQF5M
         ufBt/PRDtEWjOSR+LgPVOvcviOWmi4FWpMzDXGbuUMTunlOS+UuuMZ3s9VF4bb6kgx9Z
         6HRiACN6v99zcR7abmSoOtuJfEyRd3E+ei3pxUqlCbutQjet/tP+nawCfH4KiLxEUfWZ
         73y6k+BcDAE1K3PfbD44uer3LLrBP0HXtF5pp1ksNC9MNUeQFSXxeP9qxNMkYC2dc2kX
         K0qA==
X-Gm-Message-State: AOAM5317oCVIE0rdhKncbj073TI4617EC/1JIRA1CNiz7HPcIZy9SY8A
        Ns4Ybc6cnISeOVOkW+iyYA==
X-Google-Smtp-Source: ABdhPJxAgyxH5cxoeGuu0eeWquHZcEMF8ezBv0YY/1s2b73FPQIq9728Vf5uBDuhVlOEP+SClCs7Pw==
X-Received: by 2002:a92:874a:: with SMTP id d10mr8858913ilm.163.1600870534229;
        Wed, 23 Sep 2020 07:15:34 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id c12sm11014101ili.48.2020.09.23.07.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 07:15:33 -0700 (PDT)
Received: (nullmailer pid 661217 invoked by uid 1000);
        Wed, 23 Sep 2020 14:15:32 -0000
Date:   Wed, 23 Sep 2020 08:15:32 -0600
From:   Rob Herring <robh@kernel.org>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     robh+dt@kernel.org, linux-hwmon@vger.kernel.org,
        linux@roeck-us.net, devicetree@vger.kernel.org
Subject: Re: [PATCH hwmon-next v2 2/2] dt-bindings: Add MP2975 voltage
 regulator device
Message-ID: <20200923141532.GA660614@bogus>
References: <20200922200504.15375-1-vadimp@nvidia.com>
 <20200922200504.15375-3-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200922200504.15375-3-vadimp@nvidia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, 22 Sep 2020 23:05:04 +0300, Vadim Pasternak wrote:
> Monolithic Power Systems, Inc. (MPS) dual-loop, digital, multi-phase
> controller.
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 


My bot found errors running 'make dt_binding_check' on your patch:

Traceback (most recent call last):
  File "/usr/local/bin/dt-extract-example", line 45, in <module>
    binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 343, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 111, in get_single_data
    node = self.composer.get_single_node()
  File "_ruamel_yaml.pyx", line 706, in _ruamel_yaml.CParser.get_single_node
  File "_ruamel_yaml.pyx", line 724, in _ruamel_yaml.CParser._compose_document
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 773, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 850, in _ruamel_yaml.CParser._compose_sequence_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 773, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 852, in _ruamel_yaml.CParser._compose_sequence_node
  File "_ruamel_yaml.pyx", line 904, in _ruamel_yaml.CParser._parse_next_event
ruamel.yaml.scanner.ScannerError: while scanning a plain scalar
  in "<unicode string>", line 82, column 13
found a tab character that violates indentation
  in "<unicode string>", line 83, column 1
make[1]: *** [Documentation/devicetree/bindings/Makefile:18: Documentation/devicetree/bindings/trivial-devices.example.dts] Error 1
make[1]: *** Deleting file 'Documentation/devicetree/bindings/trivial-devices.example.dts'
make[1]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/trivial-devices.yaml:  while scanning a plain scalar
  in "<unicode string>", line 82, column 13
found a tab character that violates indentation
  in "<unicode string>", line 83, column 1
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/trivial-devices.yaml: ignoring, error parsing file
warning: no schema found in file: ./Documentation/devicetree/bindings/trivial-devices.yaml
make: *** [Makefile:1366: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1369246

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

