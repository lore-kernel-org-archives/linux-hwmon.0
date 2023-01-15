Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 904A4C63797
	for <linux-hwmon@archiver.kernel.org>; Sun, 15 Jan 2023 16:15:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231519AbjAOQPw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 15 Jan 2023 11:15:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231518AbjAOQPv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 15 Jan 2023 11:15:51 -0500
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C2A95594
        for <linux-hwmon@vger.kernel.org>; Sun, 15 Jan 2023 08:15:50 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id n8so21512470oih.0
        for <linux-hwmon@vger.kernel.org>; Sun, 15 Jan 2023 08:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qq9sMdPGuZtT4iwkxs1RRMlAkCor4GaDdugrENnDFUc=;
        b=pEY0CBoJTiA/w1UFMXvDnWVw8gZKHe2S2jvuanbWCzWfIxb5lDZY9g+PCqi5e1QW5t
         y5ESkAPXU9PYYJ7sU3Bt19X35jia9CEG0BR8aHy9LUO9+mUZjhGny0FNWiA9Esc6/S0O
         CptEwUWGekobE9liTshtFlmJH0YnRa7rOTTUea0eHjh7D0u5zlR8qnrrO/75pvBgoKYK
         tFrOGcV27s7hRamBoH85x1a7rm+SZ5nFOvxB1kt78YAvCihq0qsEmjdewIfWv3f4onLy
         PoinkVYZaCSbeK/gfdTSr56vUn/ManFzcFT3Ft4BrhKjpjxSvuKx+tlbfjYKN6PrZCdw
         JcFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qq9sMdPGuZtT4iwkxs1RRMlAkCor4GaDdugrENnDFUc=;
        b=2pQ7fXECPUjupF2AASWEEpDWZQ3aBZ4tgCHD+vEI5ouff89zhsmIyhRes+HPq3j2Uz
         1/ThBbje9Lj8hd+JOF/MTTVO3Jcnut6YFDbXhQ/StJiKBKdXUBIlyflROgbwJakX+jRy
         s2AOfvaGGap9w0KZey632qzLtFiiY3N1SBrTYwNq4EMVwqAg56HI/ej6oQ8kDkqQFc7t
         CpnfRGqA3ztdPnrwxwFypiYlXrdhtCVYZjhKqMVgRIARwNEAo6XHCe2/PqAnlYVL+08g
         rKxy+azYiLwpGpivvwg6Dg3KhcBBYWBJ7c9iInAPoRb6LVlhPlToNCBmGhlRNYJe/DiQ
         xXNw==
X-Gm-Message-State: AFqh2kpMepkC512f2o09pk364F1a+P0XV8bS8mCRymp03QUfqgqYvNFO
        e1BBQbHwcERKu1KVYY/eRy+l0VRoMgo=
X-Google-Smtp-Source: AMrXdXs6EuCY97CXShjwwJb2NfMcOjd2O+zpeYdMTpXQ6XJk81Udh9UznmdV8WQka7vwdOIySQN8bg==
X-Received: by 2002:a05:6808:30a8:b0:35e:728d:6de4 with SMTP id bl40-20020a05680830a800b0035e728d6de4mr52496486oib.2.1673799349348;
        Sun, 15 Jan 2023 08:15:49 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bd25-20020a056808221900b0035e7d07bf9dsm11508705oib.16.2023.01.15.08.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 08:15:48 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 15 Jan 2023 08:15:47 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Felix Nieuwenhuizen <Felix.Nieuwenhuizen@etas.com>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] hwmon: (pmbus/ltc2978) add support for LTC7132 - docs
Message-ID: <20230115161547.GA1246825@roeck-us.net>
References: <20221208021303.GA3373033-robh@kernel.org>
 <20230105074900.5730-1-Felix.Nieuwenhuizen@etas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230105074900.5730-1-Felix.Nieuwenhuizen@etas.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Jan 05, 2023 at 08:49:00AM +0100, Felix Nieuwenhuizen wrote:
> Add missing compatible string "lltc,ltc7132" to the bindings documentation.
> 
> Signed-off-by: Felix Nieuwenhuizen <Felix.Nieuwenhuizen@etas.com>

This needs to be reviewed by a DT maintainer. Please refer to
scripts/get_maintainer.pl to determine who needs to be copied.

Guenter

> ---
>  Documentation/devicetree/bindings/hwmon/ltc2978.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ltc2978.txt b/Documentation/devicetree/bindings/hwmon/ltc2978.txt
> index 4e7f6215a453..61783b3819bf 100644
> --- a/Documentation/devicetree/bindings/hwmon/ltc2978.txt
> +++ b/Documentation/devicetree/bindings/hwmon/ltc2978.txt
> @@ -16,6 +16,7 @@ Required properties:
>    * "lltc,ltc3886"
>    * "lltc,ltc3887"
>    * "lltc,ltc3889"
> +  * "lltc,ltc7132"
>    * "lltc,ltc7880"
>    * "lltc,ltm2987"
>    * "lltc,ltm4664"
