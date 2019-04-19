Return-Path: <SRS0=Ylrj=SV=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F938C282DA
	for <linux-hwmon@archiver.kernel.org>; Fri, 19 Apr 2019 19:05:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DBBF920645
	for <linux-hwmon@archiver.kernel.org>; Fri, 19 Apr 2019 19:05:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sxt16PTN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729134AbfDSTDv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 19 Apr 2019 15:03:51 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:33419 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727982AbfDSTDu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 19 Apr 2019 15:03:50 -0400
Received: by mail-pl1-f195.google.com with SMTP id t16so2987315plo.0
        for <linux-hwmon@vger.kernel.org>; Fri, 19 Apr 2019 12:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/xWnrj+PzDZSPrd+wXssByDt99idR+XINbbYqtnzOz4=;
        b=sxt16PTNNzEHl2Dic0XXnWJGHgLIvu3zLi+vWB87INLt3XkchqLtgi3Q9KmhQ8HT+V
         GV3gGALfvIG3O1/PqW8ePwEZEDB/aGZjjIJHJJpz7bpZtXiXCycDaJpG2wbxlOA7T+/6
         IW7mfvlz9zgbpMzUE3ZdWYwzXI13RFdc3b9eIRkBAVClp1wGoSKDcDCfxuNuTEzjAQ0S
         s0tAbbETaDuqSH4/yWk8rbzLmqaWayC+dn1ZLRZyrtIWGbYwKCd0XRdJ2F4cmMhYUzNN
         Sz/5bpqBk0Qd/3bMk70NSCIjcU5FsVVVDLQv2NFO9SwPyep3UBf2OPvIWY8WycNF264K
         giIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=/xWnrj+PzDZSPrd+wXssByDt99idR+XINbbYqtnzOz4=;
        b=myh6ZJ5TQ4qRYUMhri04bSHIKcEkvnio4Ti3XlqZzRt1bzpXPoGGitJUxYp+YYZllj
         uBThKLtA8GNCSfLMTnoQP6NGxp5x6xOgDqXQM5Ih6a7t8raKDUSXBkoUtKTl20/fdZk6
         scTzB3x0QVyY5KhrDX1+i2zUzKw+ArsMtyCWGspH/cGip7eG9G0fAznBOkv1bt1mEV0j
         XR8+cBO7CoPa41JFZ5kXv/oS5C5vqUqC7kPBBcSQqXvFt/jvAw8I+BKZYMmvO1RH/tAn
         iyVeHY7Q+9cUB4SUDIoM4VuZMx1WhC3tnlQ78+fHRUZz1+Z9vZNa4UhhPipiesrliCej
         mbQQ==
X-Gm-Message-State: APjAAAXC1y5lpMtUMh/sZViRlDvL8I+pwBAHrAH7RojUNp2x8btfKZ+H
        o/jIVZP3CPry1eFbMtByvlhYix+P
X-Google-Smtp-Source: APXvYqxJMWTlLRun21KCDr4n/tTsyMrXN3sey4gmN9xk+dmFpIxXH0ZXCzEto6sD2DKIfgxmhvJ6tA==
X-Received: by 2002:a17:902:e183:: with SMTP id cd3mr3885836plb.233.1555681213135;
        Fri, 19 Apr 2019 06:40:13 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e21sm6598474pfd.177.2019.04.19.06.40.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Apr 2019 06:40:11 -0700 (PDT)
Date:   Fri, 19 Apr 2019 06:40:10 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com
Subject: Re: [PATCH v4] hwmon: max6650: add thermal cooling device capability
Message-ID: <20190419134010.GA18697@roeck-us.net>
References: <20190419131520.GA2566@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190419131520.GA2566@roeck-us.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Apr 19, 2019 at 06:15:20AM -0700, Guenter Roeck wrote:
> On Thu, Apr 18, 2019 at 08:57:22PM -0400, Jean-Francois Dagenais wrote:
> > This allows max6650 devices to be referenced in dts as a cooling device.
> > 
> > The pwm value seems duplicated in cooling_dev_state but since pwm goes
> > through rounding logic into data->dac, it is modified and messes with
> > the thermal zone state algorithms. It's also better to serve a cache
> > value, thus avoiding periodic actual i2c traffic.
> > 
> > Signed-off-by: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
> 
> Looking into this more closely, I notice that it has a substantial downside:
> It only registers one channel with the thermal subsystem. That is ok for
> max6650, but it is a problem for max6651. There, it only registers a single
> channel. Worse, extending it later would be difficult since the single-channel
> support implies that the thermal data in the dts file would (probably) have to
> look completely different for multi-channel support.
> 
> How does your proposed dts file look like ? Can we possibly adjust it to work
> with multiple channels (ie with all channels of max6651) ?
> 
Never mind, I am talking nonsense. The max6651 has 4 tachometer input channels,
but only one pwm channel. Sorry for the noise. I'll apply your patch.

Can you send me a register dump for the chip (from i2cdump) ? 

Thanks,
Guenter
