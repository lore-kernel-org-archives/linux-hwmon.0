Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB656C4332F
	for <linux-hwmon@archiver.kernel.org>; Thu,  2 Nov 2023 03:14:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229477AbjKBDOL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 1 Nov 2023 23:14:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232949AbjKBDOK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 1 Nov 2023 23:14:10 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2B6F113;
        Wed,  1 Nov 2023 20:14:07 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3b4145e887bso257983b6e.3;
        Wed, 01 Nov 2023 20:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698894847; x=1699499647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Ng+Ky2De9mKEU9cACPl0CpnKEJS0eue27RL+2JZ1s8=;
        b=eCnxDRLiSUXAChl9U/MEDv23QFzLllIpgtDjPoQlV1dO+79FGy0Qm+Znb0c9DjC0+J
         OdrDKPGjdP6y/1JgEQWDOKAFYSNJWMRFSqpwUtK/7U31STZJ7DFsL97f6Hjn74dzXx64
         bS/iiu7iJqm3qj3TrL/m/eZQNcwYuYpH2QyFhSGvSAIH3+7rHE7NxGUVppJKmfrieP7z
         PczOUiFIAtTSAt0636SSwTn5uI9gERRq3RMK3iVLytIQ6CW9R0+WQ7rn+YpKrXh1crBO
         kFskOTGV1jZ57D300kR83ntXOFp/Iacm+BGdj1DW5SL5cx9GiFS55jfbU1GkA0wVM/ac
         wS0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698894847; x=1699499647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Ng+Ky2De9mKEU9cACPl0CpnKEJS0eue27RL+2JZ1s8=;
        b=SNizcXjPkJ4pzC8JZhYdYCaWGqUFZ6MtbXf5ZDREr7As0O4clZX9T0LJDV/DLIAaRZ
         MrLI2fC6EfHzL21mK9Lhq3k+n0Cs+ORVTpexJQ/bfrBtrEb2Q+2KjRbbbBKMOdI8X01t
         eTmdmpnodCsQdF3jv2WmKxbiGM4/sFMw/3m5q9w3yz4gd0JN4lz1+/7D/zo+4YAMjS4f
         gauFMOIn4DbfH20Zr3qyxV9o5i1OAu6yx6oUg4p1+OP7Q777hicgW6Zg81WJYv1CSEud
         1DzwIH3T5b7P0Cc+rhmeJfVT/d2w0/MrEZsAv4R4lj/jyWOJ2RnHHs10DBd6yVXhOFlE
         Qg1Q==
X-Gm-Message-State: AOJu0YxEYVj4VAzuqHANIsXxMuMNywaZD2J2yQ6QSYwCgN+66N6vgrqg
        mNas2rPcXC6UDXosMIrmIoY=
X-Google-Smtp-Source: AGHT+IEEI4dvb7QQTncXlStBqRd1w90xo3S0vMQiCz+d240Aib9+mztsA684rMGZIJudpyercdkBZA==
X-Received: by 2002:a05:6808:30a4:b0:3af:a0bd:45b7 with SMTP id bl36-20020a05680830a400b003afa0bd45b7mr22115843oib.13.1698894846743;
        Wed, 01 Nov 2023 20:14:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z20-20020a056808065400b003adcaf28f61sm417866oih.41.2023.11.01.20.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 20:14:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 1 Nov 2023 20:14:05 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Tomer Maimon <tmaimon77@gmail.com>
Cc:     jdelvare@suse.com, avifishman70@gmail.com, tali.perry1@gmail.com,
        joel@jms.id.au, andrew@codeconstruct.com.au, venture@google.com,
        yuenn@google.com, benjaminfair@google.com, j.neuschaefer@gmx.net,
        openbmc@lists.ozlabs.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/1] hwmon: npcm750-pwm-fan: Add NPCM8xx support
Message-ID: <8d9d439b-70f7-4e9e-bcfd-b18182d5bb39@roeck-us.net>
References: <20231031075806.400872-1-tmaimon77@gmail.com>
 <20231031075806.400872-2-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031075806.400872-2-tmaimon77@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Oct 31, 2023 at 09:58:06AM +0200, Tomer Maimon wrote:
> Adding Pulse Width Modulation (PWM) and fan tacho NPCM8xx support to
> NPCM PWM and fan tacho driver.
> NPCM8xx uses a different number of PWM devices.
> 
> As part of adding NPCM8XX support:
> - Add NPCM8xx specific compatible string.
> - Add data to handle architecture-specific PWM parameters.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

Applied to hwmon-next. I'll push it after the relase window closes.

Side note: An introductory patch is not necessary for single
patches. Providing the change log in the unnecessary intro patch
only adds additional overhead for no gain.

Guenter
