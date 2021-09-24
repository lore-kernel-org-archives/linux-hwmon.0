Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C90C433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 12:46:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 389C06124F
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 12:46:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343906AbhIXMr1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 24 Sep 2021 08:47:27 -0400
Received: from mail-ot1-f46.google.com ([209.85.210.46]:35499 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343918AbhIXMqf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Sep 2021 08:46:35 -0400
Received: by mail-ot1-f46.google.com with SMTP id 77-20020a9d0ed3000000b00546e10e6699so13019630otj.2;
        Fri, 24 Sep 2021 05:45:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=Wgucp1DOQ+C8sAHydAqEv0e8F52E/8/b99g6HgdyWA8=;
        b=Ri+pyGAOncz4MZHEFlFfjK/YTOARhV3MvFuEl3FHizD8VmqcLD68B8CX+k58oTSKyW
         cX9T0vdE6eNmlDTcLDhAKlRYYcUkbOTXibj62UDnW8b6s6mdS3nk5Cos0DsJUelIM83e
         65OhgEnlNlC/IPQ1QgRpnHir37/FI46Wud4LLpg9tvPWoPt1tCg3JUPkRl4thDtwfTev
         2qUNEF4IMynb+CQg2OQOhvl9zJCI+q1w0m3FER80uKq+o046iOo4+UVoyKvQIMz0LbSZ
         AyjfhsIzjLK/WAOIh/J1bPi3abhtDeWZp/ku8F+RrX+jH9eTV2Bs2QFzdANkDshbiOgA
         6HhQ==
X-Gm-Message-State: AOAM533RsCQjI1zY0OrQhe2yLQvNXpwVhobK+bJtD9sQqgkxspePy2un
        hDHbjYslQg2VDAKrHBSmLa90qSZsIA==
X-Google-Smtp-Source: ABdhPJwHj5im+dsOBMltHXyxc2CaQdih0Og7bXfdaZODIyDl1+uQCBjvHxYFnLiyKbeuMZzIcoC+QQ==
X-Received: by 2002:a9d:5a81:: with SMTP id w1mr3646212oth.307.1632487501913;
        Fri, 24 Sep 2021 05:45:01 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id z10sm1986010otq.64.2021.09.24.05.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 05:45:01 -0700 (PDT)
Received: (nullmailer pid 1091569 invoked by uid 1000);
        Fri, 24 Sep 2021 12:45:00 -0000
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>
Cc:     devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Przemyslaw Cencner <przemyslaw.cencner@nokia.com>
In-Reply-To: <cad7ca2084491b58d7f5d72e43f9b6dc9ec0fd69.1632473318.git.krzysztof.adamski@nokia.com>
References: <cover.1632473318.git.krzysztof.adamski@nokia.com> <cad7ca2084491b58d7f5d72e43f9b6dc9ec0fd69.1632473318.git.krzysztof.adamski@nokia.com>
Subject: Re: [PATCH v2 01/10] dt-bindings: hwmon: add missing tmp421 binding
Date:   Fri, 24 Sep 2021 07:45:00 -0500
Message-Id: <1632487500.109276.1091568.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, 24 Sep 2021 11:38:50 +0200, Krzysztof Adamski wrote:
> Add basic description of the tmp421 driver DT bindings.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> ---
>  .../devicetree/bindings/hwmon/ti,tmp421.yaml  | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/hwmon/ti,tmp421.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/hwmon/ti,tmp421.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1532139

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

