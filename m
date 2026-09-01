Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DF54CCDE0
	for <linux-hwmon@vger.kernel.org>; Tue,  1 Sep 2026 23:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788303820; cv=none; b=Foo8OFkqjyEIruUKHYBNXqLJprl2zacmjy2LkFBXgNyTyNJwqrUcqLBGcRmNJHW572T7SWhOTIaEhgA1YGtHOg3V2aLMqoZtzslMxSyXM3S0xmNWhxxpR8uoATaDDfgy7KOmxEgGYbUhJ8ttda7IjfSRHQ8K11bGRDzP5ZynbrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788303820; c=relaxed/simple;
	bh=rMfzhmkS3+NEEtlWyUSKbmaly2ciRVpN2bEMUsmpKNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a8uCKvwpJ1HxhY++ZiI6phOQPEufi4akKw4zx4exmkeVMS++1XqB9B+XyPuBQ+6Y/Pn/MzLxhnY6g9atE/tBC6Ue2ucZ3vg1zJ+j0YsY1ax6VD8VyQ4Ii47HBTKRSUDdEglOikdgCiOe6gk2b3LFA76th3Dcx7UFQUKhgmBDeuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TVvhXZmr; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TVvhXZmr"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-398b3d66515so497402a91.0
        for <linux-hwmon@vger.kernel.org>; Tue, 01 Sep 2026 16:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788303818; x=1788908618; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WBLB/zeiuA6kMAuoU5P+n5s76sSqbIoz3kRxZfYruMQ=;
        b=TVvhXZmr3w9oYeJRjh7A82IlIzJb788aoPyNqPMgPgoWCiRxTkDRut807pfDg95TPK
         /0bHMP3YhdA5Ti57yDIYA2rO36qXl6okIMo+8jhrxgi4caO3VltrCxNl9Fc52Iw+A587
         s8snhfdnatSYNdIQ88JI7aSv4cGAwnZkzkKGSG42EgG2Z+Ao1r34oTEgAC3yH7tBpomR
         UCR2434ycRIfaYywCFM2ZE4rPRd3YJTH2CAN1mhUwGfRNFN5+aBeeNPoAgeETtLSfLu+
         uSFiGzTwQL85pwzGwMt588lwZ92bH+V5T5fzoPIhJLbYniEcWr3oNMuiHr3oFba7zMBM
         c2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788303818; x=1788908618;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WBLB/zeiuA6kMAuoU5P+n5s76sSqbIoz3kRxZfYruMQ=;
        b=UV4c20PgKMAIOkaFsUBLvYkVmPYwJ5b44TTQLfMynLdhgmJL/rOjtJuujCkY8HuRuC
         cPH6okQMH4ig4s06N71S6oCYxm4XW/TsiiBUl2PhQLieqljNC7pUSmYBLhp+bNW3dE8u
         jmQQE7B7Po6FR+SpTTPJ/9FRFAV2u1oOq15eldKK3QzMt5zKGh3n+mQX/YbRoaJ4fZ2o
         W94FY0OVZWcs6JtHvoQdVefrDTlUy1gnsRQ2p8g7BNAO+MRSyL9GVEKuCvpSDKTKFhth
         7cBbCDMNM5Nmo9w6elXWfOBf3rF3d1e1ldsxI5adgdWgKSsMmx+XQgMaQvai+FHfaE/j
         DSkw==
X-Gm-Message-State: AFuF++mL1duDsiOJzdN9SUHLWXyAwBX77ABr2t7G/dwn44ort7auirtx
	oayPr77NXyw0rOfN1PNybtXbXmxZyqIjImUarKdqC1m7Z+ppVom2XrIaHIODKQ==
X-Gm-Gg: AYBFou1w+eUQfwgDy0BAMnYoCVZGZuvKziJJeaZ1LVPIAPGHcQvLMxmf35rRnRit1pE
	tulaiw/WwL/ywYxjSVTRQ6XBnVn+Ao23bKNnWdVWK64+EQC2QtNRxOciP6LvHbFZ4xb/qEnAnyH
	4CJQlgDxGU6xvywOGS6mGwy3TkXopny5fyUvgipcPMq5RPPc0tnVOZGb6L92/SAQsSGDuSq9tT1
	CfG0hEO1LeH1J3+q1/0aB4cGFgWpjiXKOA8dl2hUZNeHDET+w5Uh7+s6XF2UM88ZeFrxfXSERvB
	KW32P4ngJrLx8ZjeRarA1eW7tF9REid46mKNERftHMchm0VCmTdBpgXztBTwp/PHxdF7Gq4OCKw
	RPArPUVKGZhu3qsLueegbmFuLdR5jcFzoEZCL868oIYTXPymiCLi9jYtytrMkrkulFFGQzeYWKD
	oUdajye28OqfMZ018Fi4svf0NtbkY8KzX2NZVi8Uik5V+VgtYqJYKXwfVLlje+Zy0blA8yx1vX/
	w==
X-Received: by 2002:a17:90a:c10e:b0:398:c3a3:dbd0 with SMTP id 98e67ed59e1d1-39aedfcc05dmr536835a91.8.1788303818176;
        Tue, 01 Sep 2026 16:03:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1430ea2d3e7sm2239305c88.6.2026.09.01.16.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 16:03:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 1 Sep 2026 16:03:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Armin Wolf <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	ggirouard@bungeetaco.com
Subject: Re: [PATCH v4 1/2] hwmon: (spd5118) Select page 0 unconditionally
 during probe
Message-ID: <e705b5f4-c0f1-4569-a513-b81a81735e56@roeck-us.net>
References: <20260901200142.495319-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901200142.495319-1-W_Armin@gmx.de>

On Tue, Sep 01, 2026 at 10:01:41PM +0200, Armin Wolf wrote:
> Some Intel i2c controllers can be configured by the BIOS to reject
> writes to the SPD device. This often causes problems when the register
> page needs to be changed, usually during resume.
> 
> Avoid probing on affected devices by unconditionally selecting page 0
> by writing the SPD5118_REG_I2C_LEGACY_MODE register during probe.
> This will fail on affected controllers and thus prevent the driver
> from probing.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Applied.

Thanks,
Guenter
