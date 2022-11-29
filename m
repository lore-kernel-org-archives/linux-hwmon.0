Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75A16C46467
	for <linux-hwmon@archiver.kernel.org>; Tue, 29 Nov 2022 14:18:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235648AbiK2OSE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 29 Nov 2022 09:18:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234020AbiK2ORX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 29 Nov 2022 09:17:23 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAF9D68C6A
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Nov 2022 06:15:30 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id e15so9539268ljl.7
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Nov 2022 06:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hsnckQ+8SFGbO04BpVRnsDtmRSn9Ni4f0qnwe8AiADo=;
        b=IGhPJ8dX6nb5Z8HsOUNYC5YL8iJKkyqLeGkbHiGxaeoIHpgJyOLHncztlilCAIPeAU
         aUSrVaGX+5Da0paALXjUFDOBHUJx3ahG+RqzfmLtLWGK3FHqQPg7dlU5vFF+FdTFk52s
         4B8K0gNzWKLkPxoYmBoONHxuMJi/hx/TompcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hsnckQ+8SFGbO04BpVRnsDtmRSn9Ni4f0qnwe8AiADo=;
        b=HnJ+8FUpZbh/LpLg6TkwIsy6MLH3L31gjTObrIKIeHTQ7Y1sxxDvP0guMF7ImBIF5h
         Mgmghw6HVfRXUuwRXJQ5X/fm3090TzChVTrVxln5Grfy623dUWKymlfcLVZ4psKkG74i
         1hqAViZEY5OMPvBXOZNqoPEHBPaNSZm/xLZEaF/u67ylDeuqUnOhvkk+jotWtJekXEzu
         HYdV+A7SVEY1+VDDlLfSSXAbmQC6UF4kGpAQezeJzfAYWHcxDg0pxb4HNINp7/jtxKPB
         NQSW5n71HPsw+PjMGzeoY686xW+P5gIE4bGNknc3m3xg6HldyJvu/7ZSXVcJOKSJw8vs
         Hb2w==
X-Gm-Message-State: ANoB5pkA/eeb6AJQxnGhGuplsNww35pmCTASm2fns45ytFk39D9FWEWj
        b75WtvhhKrNF0nYnBsOrceVCLg==
X-Google-Smtp-Source: AA0mqf5wUuCLPqi/+uagh8q9RS0D0xLgknDToqVyGJ4p1/SsKlDQOmUWONg6qrKmZ46fs/ER7PD0pg==
X-Received: by 2002:ac2:558c:0:b0:4a2:4b78:a8e8 with SMTP id v12-20020ac2558c000000b004a24b78a8e8mr15251964lfg.292.1669731315968;
        Tue, 29 Nov 2022 06:15:15 -0800 (PST)
Received: from [172.21.3.193] ([87.54.42.112])
        by smtp.gmail.com with ESMTPSA id v3-20020a2e9243000000b002770eafaafbsm1549640ljg.99.2022.11.29.06.15.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 06:15:15 -0800 (PST)
Message-ID: <a258befe-8016-4244-346a-12b83012e89d@rasmusvillemoes.dk>
Date:   Tue, 29 Nov 2022 15:15:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 4/5] rtc: isl12022: Join string literals back
Content-Language: en-US, da
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
References: <20221126141806.62205-1-andriy.shevchenko@linux.intel.com>
 <20221126141806.62205-4-andriy.shevchenko@linux.intel.com>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
In-Reply-To: <20221126141806.62205-4-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 26/11/2022 15.18, Andy Shevchenko wrote:
> For easy grepping on debug purposes join string literals back in
> the messages.
> 
> While at it, drop __func__ parameter from unique enough dev_dbg()
> message as Dynamic Debug can retrieve this at run time.

Acked-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>

