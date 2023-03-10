Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C279AC64EC4
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Mar 2023 16:43:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230407AbjCJQnk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 10 Mar 2023 11:43:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230432AbjCJQm5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 10 Mar 2023 11:42:57 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB3DB11F62D;
        Fri, 10 Mar 2023 08:40:43 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id be16so4732306oib.0;
        Fri, 10 Mar 2023 08:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678466438;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jBvFWrg6mAMkwkQ8SljaAvheQM7EIirHVmL1w1bEVNo=;
        b=X5CtmMPn2kOVec/4NiHmamfxtPdKG1/eHlLzVQjG9YPcEHdftSX3T9gXV8xtf0EAnj
         2RKzNUtubrxpDAnxpxiJdmOvCsrBuLwiTaCke+PULh2m2TVJHERSMsPgdjf1rXdbbDi4
         qHWyLisLzasd1fCHQ6GoFWQ4kQkmwNZ+Rjw09UIXFZW3c026F0RnYX2z75mEi/QnP0RW
         /ufQXEN0GzWKuPPM8YdsVsINc2tp2yoA7dZg/cCNvK2DjePD8agnRGI/SDrhBgG265sg
         Hj7zwMCvZc7zzpPkPvxdb9z0+X1hyq4FU6emGjPFRnrmunKpgDQZAU8fKFVuFpJRAQos
         nWeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678466438;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jBvFWrg6mAMkwkQ8SljaAvheQM7EIirHVmL1w1bEVNo=;
        b=u7qHZqHI88nti3+g4LfxMH9chwlGZYuTxuVjdTfZ6l2smYkkjd7C5BJwrRdljMfXSn
         8TpvKbhSVqk+C1oJNfidPfKYrFCehLeQ+LtKwMH9Sz2fxYHrymDFjcJEPuPnxD6odOZY
         6wsXDg7Fej5th9JcVqgo1zp9reAHubQs260mTZPKpRbLrYiLDTRX1cjiTkwfvscFhz1J
         E2lSfBMwF58v3h5lKEWMsaVwNtM+27104bpYFpeg+XJ5//Jswg/ZJVSIbWMZ/GCTrkQh
         n0tPXhLmp8hwZbkhdQB19vCbYGFHR/f8vCIZ6SdZBZhE44bhLTwz1xqBg9NcyO9OvDlV
         A2pg==
X-Gm-Message-State: AO0yUKVVjv9hsFgzooIgVIveGwEoHzqpDCriVa8CAVVCjiWPIBPCjVoV
        nJgO3/QgA/vibGNgFC+It/7B1WjB+t8=
X-Google-Smtp-Source: AK7set9HuDt+qOpqR7eyTe9az8RXhvaIVIIhH1ETOCOQ1Z8gdforHkz/vhtVjYHI70EKMaPzkeoQMQ==
X-Received: by 2002:a05:6808:298a:b0:384:2942:e2e1 with SMTP id ex10-20020a056808298a00b003842942e2e1mr11393992oib.41.1678466437904;
        Fri, 10 Mar 2023 08:40:37 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bj34-20020a05680819a200b0037d8aec19e0sm31751oib.36.2023.03.10.08.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 08:40:37 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 10 Mar 2023 08:40:36 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Armin Wolf <W_Armin@gmx.de>
Cc:     jdelvare@suse.com, corbet@lwn.net, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (ftsteutates) Update specifications website
Message-ID: <8c41e889-55c5-4386-b1b4-b2675bfe3330@roeck-us.net>
References: <20230226014830.10929-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230226014830.10929-1-W_Armin@gmx.de>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Feb 26, 2023 at 02:48:30AM +0100, Armin Wolf wrote:
> The Fujitsu OEM Mainboard business was acquired by Kontron,
> so the specifications of the Teutates chip was transferred to
> the new Kontron FTP server.
> 
> Update the specifications website accordingly. The outdated
> sensors how-to was omitted.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Applied.

Thanks,
Guenter

> ---
>  Documentation/hwmon/ftsteutates.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> --
> 2.30.2
> 
> diff --git a/Documentation/hwmon/ftsteutates.rst b/Documentation/hwmon/ftsteutates.rst
> index b3bfec36661d..2abd16830c99 100644
> --- a/Documentation/hwmon/ftsteutates.rst
> +++ b/Documentation/hwmon/ftsteutates.rst
> @@ -36,7 +36,7 @@ correct path to the alarm file::
> 
>  	echo 0 >XXXX_alarm
> 
> -Specification of the chip can be found here:
> +Specifications of the chip can be found at the `Kontron FTP Server <http://ftp.kontron.com/>`_ (username = "anonymous", no password required)
> +under the following path:
> 
> -- ftp://ftp.ts.fujitsu.com/pub/Mainboard-OEM-Sales/Services/Software&Tools/Linux_SystemMonitoring&Watchdog&GPIO/BMC-Teutates_Specification_V1.21.pdf
> -- ftp://ftp.ts.fujitsu.com/pub/Mainboard-OEM-Sales/Services/Software&Tools/Linux_SystemMonitoring&Watchdog&GPIO/Fujitsu_mainboards-1-Sensors_HowTo-en-US.pdf
> +  /Services/Software_Tools/Linux_SystemMonitoring_Watchdog_GPIO/BMC-Teutates_Specification_V1.21.pdf
