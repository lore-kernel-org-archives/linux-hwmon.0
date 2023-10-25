Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B14AC07545
	for <linux-hwmon@archiver.kernel.org>; Wed, 25 Oct 2023 19:38:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbjJYTie (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 25 Oct 2023 15:38:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjJYTid (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 Oct 2023 15:38:33 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36C1013A;
        Wed, 25 Oct 2023 12:38:32 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-27d1aee5aa1so82251a91.0;
        Wed, 25 Oct 2023 12:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698262711; x=1698867511; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6z0oQ7+PlkATT0Vdd6vvsp8LGGR7gTa4RN839qkxV70=;
        b=ECiSZqHCdUEfFxn38vB/32Yz4/t0xLOUYD2M/z+E8PwBZbZNM1XanG9OsqpDEszOaf
         K0mAfB/0iXZ3iMjvPGkyJapt7msvdCJOgfV1IhgYEF5mcrCBvB43rllLSz5MNtPJZkqr
         upOq3ty3b77HT2QInDBalnILSl1r+9BZA+lwk4+zMUNR3rtaoKSrzkCL0kK1+sDFlIMg
         aVTWiPOsmW0XVF1YkcE33Pak/EhCTfqii7BGvpEnFyACSElEbHCRHbneCN7How2vSOlF
         6crqn+knfjx3YkhjO54/nlQ/9UQgCL4aj67d1I2dOVZTESVoFZiuPte2JarSlqCzBjN3
         G3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698262711; x=1698867511;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6z0oQ7+PlkATT0Vdd6vvsp8LGGR7gTa4RN839qkxV70=;
        b=qdaV5ynu35Hn/KnsyV9jmuzMxw6bn0+eLufvzogWVrJ19yXyWSy4EQi1HCGJ1FnLqa
         NXBP9RCrvqqtkE/JGuhvtWPe4V1BZz7jiv5BYRM/9pgZWmwtNRV/30r8fV7IyJNCQ+6U
         2q7XWh049C0CpSvD9isn5VHI0A8Y+TDty/Bq6+rNDfpbwajsWsZifevLDR0vGfJyY83s
         H3rx7oCEBwTs4vWgrpuqgRRU7P1REuNodyVwVdJ+UWUhcEg3cuOx2slRxttkSGtg9MiL
         e77CYDkxm4zlizEQaxHqIOq5eKf9T287NIFm5TUUy6CHBEPjymBK934AOZZ4bmG1D1xv
         B9eA==
X-Gm-Message-State: AOJu0Yx/TDwUc37SKTpx65N9cQpvTlUZdkI7ul4QmR1811ZlMcCHS9C/
        0ZSRHIZdqfdqVw7Po51SVV3saxpnEwo=
X-Google-Smtp-Source: AGHT+IHddo8qg9luyeDGCB2S9jMN51Ao1TIS9tk3t6dVtgEvRzi03FhZ5KpwEYoihkkJytVI6X8Ptg==
X-Received: by 2002:a17:90b:1c06:b0:27c:f4a9:7e20 with SMTP id oc6-20020a17090b1c0600b0027cf4a97e20mr715215pjb.15.1698262711662;
        Wed, 25 Oct 2023 12:38:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 22-20020a17090a1a1600b0027d0d4d4128sm288828pjk.25.2023.10.25.12.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 12:38:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 25 Oct 2023 12:38:30 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Antoniu Miclaus <antoniu.miclaus@analog.com>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers: hwmon: ltc2992: avoid division by zero
Message-ID: <68829dec-8bfa-4969-84fa-0cc63a8ee012@roeck-us.net>
References: <20231011135754.13508-1-antoniu.miclaus@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011135754.13508-1-antoniu.miclaus@analog.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Oct 11, 2023 at 04:57:53PM +0300, Antoniu Miclaus wrote:
> Do not allow setting shunt resistor to 0. This results in a division by
> zero when performing current value computations based on input voltages
> and connected resistor values.
> 
> Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>

Applied. Please note that the subject should not include "drivers:".

Guenter
