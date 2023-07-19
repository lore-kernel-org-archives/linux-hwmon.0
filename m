Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C796EB64DC
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 Jul 2023 03:06:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbjGSDGT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 18 Jul 2023 23:06:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjGSDGS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 18 Jul 2023 23:06:18 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3953A1BCF;
        Tue, 18 Jul 2023 20:06:18 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-668709767b1so4746391b3a.2;
        Tue, 18 Jul 2023 20:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689735978; x=1692327978;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Z9PyE2GANnTh52Vqt31fvX9tSTvaKClVjtDBjMtSbE=;
        b=nb9kUI8bONsv2c5OXd7yUFJ2nrgwho4q5KMMSKhFHtNMcc26l2Hm5lUl0Vfp98T6zu
         ff6TWwv1zicEck5SOPfHWyMJVTwfJ9uChuZzydNhZIp7RSasfmPZAo3cJrpw/injUU8C
         FkfW7zcI7xtX2d75G3XCNF/NbWMB9JHRLSRcSCftKFtp3cRcHI6fNnOT9V1uARduE8KY
         C+85oIJJLG/9WbnnIftqf4Q+Zivai7wp+bLqC8HmVw4FENVi+KqwfHU703DeBUWV6WUk
         L2eneZ/3uvqZ9l2b5JBPpD35B5tHqZVG0A1OUsZ2auwi6Qbmh/35LRO/RMs4XtSlDr0B
         rv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689735978; x=1692327978;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Z9PyE2GANnTh52Vqt31fvX9tSTvaKClVjtDBjMtSbE=;
        b=k9kc6DFe4iW3I9cf5QocvfR8V0YiVNl0dq5Q4Dk2hoFkJKCl6NSjd2Kuvw4E8szqoV
         pMgvoIQK7Zqhsh3KAR689zVnq8EZOTuvqZGMCTHPEMfAUItYudWtyb4ty7eKOcpxA/ij
         3leLeziKy+cxjQycLVaeC78QQKkC9NP60Qb9KZddFoSgJCWusBJVQw8JJbVO1E8ab5Fv
         hZuL51NrAlVE9S3jD9mAX/ZOEbl74bDZ94rfxv8TgU+dWIGACCYJWNmY8QCoQmYrO1I4
         PnZCp3EogOGWB20NcvN8QgFodvj+acE/hZu/3R24/T3uJL/wgbF1AFaifvth+oP4/dn4
         sRZQ==
X-Gm-Message-State: ABy/qLbDVRHlfkeQNCYCFBuU7fJkOEdUGyv20Bw9859Y1W3nY6rmuXlx
        RWX2zSt/Hfl2xHP8UHg0s8c=
X-Google-Smtp-Source: APBJJlE/LlWi3gxrEQ11e9g5JSE95CD1Syqahqy7ISJg8tcqhaGyKZITfgSoHls0I9VTUNu+6IIPIA==
X-Received: by 2002:a05:6a20:7f9b:b0:131:39cc:4c21 with SMTP id d27-20020a056a207f9b00b0013139cc4c21mr3962567pzj.56.1689735977676;
        Tue, 18 Jul 2023 20:06:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j24-20020aa78d18000000b006732786b5f1sm2136641pfe.213.2023.07.18.20.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 20:06:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 18 Jul 2023 20:06:16 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Naresh Solanki <naresh.solanki@9elements.com>
Cc:     devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>
Subject: Re: [PATCH v2 5/8] hwmon: (pmbus/mp2975) Make phase count variable
Message-ID: <b2624063-393f-4fe1-a139-89db0942bc51@roeck-us.net>
References: <20230714135124.2645339-1-Naresh.Solanki@9elements.com>
 <20230714135124.2645339-5-Naresh.Solanki@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230714135124.2645339-5-Naresh.Solanki@9elements.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Jul 14, 2023 at 03:51:13PM +0200, Naresh Solanki wrote:
> From: Patrick Rudolph <patrick.rudolph@9elements.com>
> 
> In order to add support for MP2973 and MP2971 replace hardcoded
> phase count for both channels by a variable.
> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>

Applied.

Thanks,
Guenter
