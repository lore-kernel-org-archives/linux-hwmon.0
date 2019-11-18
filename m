Return-Path: <SRS0=oVpM=ZK=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AC6DC432C0
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Nov 2019 21:31:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2B6A8222EF
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Nov 2019 21:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1574112707;
	bh=lg7PgwZw/0im8/7yygcg58wmDLJTL4QlcVKgAWgVMGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=MqPOvf+qyZc/Lrl99Sk94ZnQraBR2G1QgkLpJBbMYtmNkPdAI+hngqMIIK6dsugxZ
	 X9Cg1TbCKBkRHNt3J24DhDPnvBucAwKnMoK/KWV47tudQQTVP44MexqmOsxnIDrKOO
	 suCYjJqD6l7l4IrTNjJaJBb9ZuJN2/ZcjD4wP5gk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726647AbfKRVbq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Nov 2019 16:31:46 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:45772 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbfKRVbq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Nov 2019 16:31:46 -0500
Received: by mail-oi1-f196.google.com with SMTP id 14so16749940oir.12;
        Mon, 18 Nov 2019 13:31:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xbx1aZAc7rEgW+5jmNWNB9eCM3V1hUlP5bh1eb6G9t0=;
        b=Ij7n1/eydfk0zZOvD/IFpadDYXsjj5cen19dAseW15ySdK9P7XWvinmbYSFgolXnsH
         cFI6KvHxvyuqybvd4S1DG+PKzXsqiR46P1+B0uYbN1dDFnM+sPulU7QEJsmNkn6g/t6E
         s34W4EnLlyR8qB0DbcKIKjeR4gSHbOQgwKuWZAXa07zAqAVkUEfKQuRWJYsgk1hUuMMA
         ma2DV+/HVMPMAmryRqu1lWYwntV8C0dWXXWKmH0FpWOl+jWLkbNmZWfMYPZPiyjzG2wt
         6JoCiE8wptxBhCJ6V+s9Z2syP82XEfblTMgICopM8RcM+qKmqsUumvK41CcHqNG2ZZKK
         ia8A==
X-Gm-Message-State: APjAAAUlhe05/Jh/ffrH3CY2vb5ukotSmIdpsjre00nj+GZ6qBM+ESTe
        oqxqRNirQ1CQdMdvm6/iBA==
X-Google-Smtp-Source: APXvYqyR7y1hrlJ4jytE3hcnnWJKh7pNQWwf4SPEfjTTZiLHGSnGV6pvqvm5MiOkvQudiN4HaO1Aiw==
X-Received: by 2002:aca:ed85:: with SMTP id l127mr967419oih.75.1574112704372;
        Mon, 18 Nov 2019 13:31:44 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d205sm6517189oig.28.2019.11.18.13.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 13:31:43 -0800 (PST)
Date:   Mon, 18 Nov 2019 15:31:42 -0600
From:   Rob Herring <robh@kernel.org>
To:     Eric Tremblay <etremblay@distech-controls.com>
Cc:     linux@roeck-us.net, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com,
        corbet@lwn.net
Subject: Re: [PATCH v8 1/2] dt-bindings: hwmon: Add TMP512/513
Message-ID: <20191118213142.GA26376@bogus>
References: <20191112223001.20844-1-etremblay@distech-controls.com>
 <20191112223001.20844-2-etremblay@distech-controls.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191112223001.20844-2-etremblay@distech-controls.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, 12 Nov 2019 17:30:00 -0500, Eric Tremblay wrote:
> Document the TMP513/512 device devicetree bindings
> 
> Signed-off-by: Eric Tremblay <etremblay@distech-controls.com>
> ---
>  .../devicetree/bindings/hwmon/ti,tmp513.yaml  | 93 +++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
