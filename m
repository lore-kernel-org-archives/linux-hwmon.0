Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9430EB64DA
	for <linux-hwmon@archiver.kernel.org>; Wed, 12 Jul 2023 18:04:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232814AbjGLSEJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 12 Jul 2023 14:04:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231281AbjGLSEI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 12 Jul 2023 14:04:08 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E3691FC2
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Jul 2023 11:04:07 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1b8b2b60731so34211615ad.2
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Jul 2023 11:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689185047; x=1691777047;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5DPqQvrqEcuM8QfMK2D4w0RCKWDpgX6iSDHJktjRFe4=;
        b=CrUIJ2s7hBFpEhiEyQkj4m8810Y6ZbMHKQwSlkM864oZPBGY6CgroF8QM60cAaxc73
         eoq2Vp6DjLRlMAKlpnLaGvnCzwxY6BH5UvjZOy+sIkxWN0zlbDG+tPlV9CDB2uLFWh38
         penysPKf1wJJWYaoUD+7pmHuSmD/cNmFY0RKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689185047; x=1691777047;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5DPqQvrqEcuM8QfMK2D4w0RCKWDpgX6iSDHJktjRFe4=;
        b=FIx7Cgy3M2eSshSq9ukO7VDxPAi1kkIS+vJGH480fJGPTBBmlPdnIMiiEhvuRuc7IS
         LEnVJojZ496pRvRy8Ndqo+4Ae2PX2A3e6xrCGGv+WSsDziBBiTqVxOpmxYGYKW02p9XM
         ylqOs+MBoi0eVSurVBNS03BIpbWmv4DwH5o3P1j3sybWetEdxddRx7kz5aPRUzDNaxwG
         SJugaOacahQrrqYDECOoSbPcFkYdiDddUZhZr16xg2RfT5rRkEMuprdj+hPNqm2eSeAT
         O8fwl7E26bJGiFo4+oVL4Bpjqb3+1nDg3LoZ+9jtMAi67y28GYCdETFCeUUUqlILND5H
         Bqdg==
X-Gm-Message-State: ABy/qLa/XSkP4+SeCsghyY3aK4VWsuiQebgdWKvC1IwnCBn7EZdSQFGb
        UUJ/LmmtPF7ydx3mDPoqjapyJA==
X-Google-Smtp-Source: APBJJlGiYUJifT1keXdZg9+4cHh4iEQYO+9aEAZ/+ymxyR4AFfMgTGdOVTMfY6nLSwvJbQFsDkZW2w==
X-Received: by 2002:a17:902:b691:b0:1b8:c1f:fd2c with SMTP id c17-20020a170902b69100b001b80c1ffd2cmr13628055pls.33.1689185046857;
        Wed, 12 Jul 2023 11:04:06 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902c21500b001b9d88a4d1asm4246172pll.289.2023.07.12.11.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 11:04:06 -0700 (PDT)
Date:   Wed, 12 Jul 2023 11:04:05 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Azeem Shaikh <azeemshaikh38@gmail.com>,
        linux-hardening@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH] hwmon: Remove strlcpy occurences
Message-ID: <202307121100.A6E650B@keescook>
References: <20230712144429.2845940-1-azeemshaikh38@gmail.com>
 <3034082b-4ec8-2a8d-35a2-2551e9feef34@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3034082b-4ec8-2a8d-35a2-2551e9feef34@roeck-us.net>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Jul 12, 2023 at 08:16:39AM -0700, Guenter Roeck wrote:
> On 7/12/23 07:44, Azeem Shaikh wrote:
> > [...]
> > +	len = strlen(result);
> >   	return simple_read_from_buffer(buf, count, ppos, tbuf, len);
> 
> This still copies tbuf, meaning all those constant strings won't actually
> be reported.

Ah dang, thanks for catching that. Yeah, "tbuf" should be replaced by
"result" in the simple_read_from_buffer().

-- 
Kees Cook
