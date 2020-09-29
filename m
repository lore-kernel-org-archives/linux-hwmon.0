Return-Path: <SRS0=NIjz=DG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8969EC4727C
	for <linux-hwmon@archiver.kernel.org>; Tue, 29 Sep 2020 17:21:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 179632075A
	for <linux-hwmon@archiver.kernel.org>; Tue, 29 Sep 2020 17:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601400097;
	bh=mO0I+JRGUIlOhz+mkQMgMJTCmEmawu1vSe3hHlEaiXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=jC1dB2ouZzCrh5IFK1P5mOhd7oeeWIYGYI/Q0yaMg/2V9uOpluJwK09CKZEUhSI7c
	 HDgzq3SrHoE7qpa/dUuc9+vR3PKo5cv4Aat1yTvdR+rDtak4uc/7SUFabRHNLE2uA2
	 iQFnAJxZq35/Q8B53+frP4/Ny9PySuMYpBMouD/w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728205AbgI2RVg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 29 Sep 2020 13:21:36 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:37621 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727543AbgI2RVg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 29 Sep 2020 13:21:36 -0400
Received: by mail-ot1-f68.google.com with SMTP id o8so5231378otl.4;
        Tue, 29 Sep 2020 10:21:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8jyHS/p7JhZOfKcevaqij6hUpgtUdZGq8TdsU2/JCoM=;
        b=p+kU+1QMVoAkvYQXFPAP5F8Oy646Fyuq/AAQRW9UafcY/1Tjk+4NJ1VBbphnSgSlDF
         T3cp1FS0N+Atvq/zjWHnGvKY/XYRJVFvTsUVKoTB+MEeJgUT5SLmsuo0ryCS7bMH0qbk
         Bw2sdoDlTKtdFCuuUfCPxPJKmAqpRJWr3wn1po58O6M9GrR2Yawh4erS2xHf0xnxwR0b
         OdSJ+lasASyM9FefmR1GzMX4weXhnCqnYfsXngdFkvdDtyo/orbRRnEp6a2gRXl32D2F
         rw0HH281SHGwsk8tqUvRRW89Bwn5jlcg7vnsgSWvy3Rg8hoo8SHM8cfasEwvLh1vCjd+
         zRQg==
X-Gm-Message-State: AOAM532AlgChj1zFmWDoOfVk1qxL54uRdaTuC65J5synRijBzkOlJu3f
        Nybf2M5MyzQs9upJQ0RmFw==
X-Google-Smtp-Source: ABdhPJzCBagXKRaq+zeOqbCVMRT+uYjeF7brxGYc/5BOs2FVEcPo24AneHv3WkNOh76iEqmGMKHgUg==
X-Received: by 2002:a9d:71ca:: with SMTP id z10mr3446773otj.307.1601400094212;
        Tue, 29 Sep 2020 10:21:34 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i7sm1127314oto.62.2020.09.29.10.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 10:21:33 -0700 (PDT)
Received: (nullmailer pid 807990 invoked by uid 1000);
        Tue, 29 Sep 2020 17:21:32 -0000
Date:   Tue, 29 Sep 2020 12:21:32 -0500
From:   Rob Herring <robh@kernel.org>
To:     Paul Barker <pbarker@konsulko.com>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        Kamil Debski <kamil@wypas.org>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: hwmon: pwm-fan: Support multiple fan
 tachometer inputs
Message-ID: <20200929172132.GA807909@bogus>
References: <20200920180943.352526-1-pbarker@konsulko.com>
 <20200920180943.352526-2-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200920180943.352526-2-pbarker@konsulko.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, 20 Sep 2020 19:09:40 +0100, Paul Barker wrote:
> Document and give an example of how to define multiple fan tachometer
> inputs for the pwm-fan driver.
> 
> Signed-off-by: Paul Barker <pbarker@konsulko.com>
> ---
>  .../devicetree/bindings/hwmon/pwm-fan.txt     | 28 +++++++++++++------
>  1 file changed, 19 insertions(+), 9 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
