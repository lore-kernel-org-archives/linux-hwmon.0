Return-Path: <SRS0=EtL0=YD=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB94BC4360C
	for <linux-hwmon@archiver.kernel.org>; Thu, 10 Oct 2019 15:21:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B0D1121835
	for <linux-hwmon@archiver.kernel.org>; Thu, 10 Oct 2019 15:21:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QeTFcotk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726083AbfJJPVV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 10 Oct 2019 11:21:21 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:44182 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbfJJPVU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Oct 2019 11:21:20 -0400
Received: by mail-pg1-f194.google.com with SMTP id u12so3868785pgb.11;
        Thu, 10 Oct 2019 08:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TXq1wsSyAjR7SKmr3MEgBpGVe1sTeDuk4dlEQ4iK1rY=;
        b=QeTFcotk8I7KOptIMA6EnaXXcGvvhDxkhyGIVs8EwpQtiJDZbMzCJOLYtHfcW+Et9N
         8VRe9C6qM7CU3MKDsBOGIGIt0a2MTiqyfL/uwpN0TcW2VCRrNkmBKmQYrAjaHfMbLNwI
         CWNW1RMzdvyrK4nWPfdfODJAoEm2IuGqW79lzCjtR5+/mVhlNUp+Tqpffwcif+NNWhwM
         MbAyxVHQ+XvUUpGTAqKZfZTfeFeqWcmj3lffAI/XwKTaBYfuC6D6wHLo5dhQ4LdtJEAp
         vt1v9xy9vGwQ6bC3PJ27NWJ7nG9oxi6R2r+/Czk9Ey/maOnkRVUDjGU0lAh02e1cInXZ
         QNEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=TXq1wsSyAjR7SKmr3MEgBpGVe1sTeDuk4dlEQ4iK1rY=;
        b=LPg4lUUR8MTSnbfqnWO8hLCqgSNJmiC8Frd7BYqOe0/fSmJSFfYBNZv6XEpbos6RNG
         79Ynt6ZFNoFNfzu3bPAqKqCH1Q3+r2OaEOQVkESKeuO1wccz3I3FP2baUegrA7POCntF
         /JAQgva1RX4/hOAq4o2f1Otl92/MLKHCVEDc/X73RGdFf4Gj4rXh0xXI+bbpRRDq4jVU
         tkJEgASP7b1jh1gpUkYIHFa+DesdVxNoooPVgM9G6jrcg030oQholkJcVRq61v6yCLQ8
         x8R3AtqdtUiIKlpKPMiU9b30TFRfpIlmJdw3XsVcWTdcxI4CZs88iCeQb3GxPgAbwa1h
         tkew==
X-Gm-Message-State: APjAAAVFtbYzQ2QHwTkbpgdGHE9tgUufcQ7IDRxiaxd4OF91pk981K1e
        watuZGvgqIO//ooKlEr1Id4=
X-Google-Smtp-Source: APXvYqxXHGEdyagpzK7pH65OP1SVCEx0efKX85+sMXi60/88SvIF+vp9zHbIpf2o0mbY7GB1iHaMpQ==
X-Received: by 2002:a63:364b:: with SMTP id d72mr9296602pga.432.1570720879888;
        Thu, 10 Oct 2019 08:21:19 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b5sm6902685pfp.38.2019.10.10.08.21.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Oct 2019 08:21:19 -0700 (PDT)
Date:   Thu, 10 Oct 2019 08:21:18 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Sa, Nuno" <Nuno.Sa@analog.com>
Cc:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>
Subject: Re: [PATCH 2/3] hwmon: Add support for ltc2947
Message-ID: <20191010152118.GB4320@roeck-us.net>
References: <20190924124945.491326-1-nuno.sa@analog.com>
 <20190924124945.491326-3-nuno.sa@analog.com>
 <20191003041446.GA2332@roeck-us.net>
 <d0a992bebbc3c388b6be100d1821fa5813fcc1b4.camel@analog.com>
 <20191004150623.GA28287@roeck-us.net>
 <7d4ca133201f8c75855de6777f6018567701e16a.camel@analog.com>
 <94cf417f-90fa-50b8-9d4a-d7e4c9dd3d8d@roeck-us.net>
 <5f280daff806cb73a160d10f5ec97be18d42aebb.camel@analog.com>
 <ea52f348c9fab8c9a3c3417909053f4abb12cbcb.camel@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea52f348c9fab8c9a3c3417909053f4abb12cbcb.camel@analog.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Oct 10, 2019 at 07:13:06AM +0000, Sa, Nuno wrote:
> 
> Quoting the reply I had:
> 
> "As the LTC2947 is bi-directional, the most likely use for the Min/Max
> Energy thresholds are for monitoring a battery being charged or
> discharged. 
> A limit could be set based around the battery's storage capacity so
> that the battery is protected from being overcharging or fully
> drained."
> 
> So, I'm not sure if this is a valid use case for hwmon subsystem. I'm
> aware there's also the power subsystem. So let me know what do you
> prefer here. Should I just report energyX_input attributes? Or can we
> keep the min/max?
> 
This isn't really a hwmon use case. Having such min/max attributes would
just be confusing.

Guenter
