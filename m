Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614F5337699
	for <linux-hwmon@vger.kernel.org>; Sat,  2 May 2026 18:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777745697; cv=none; b=cOiRX5QkynY0vW3W0w6/tXb2RuavieEB6Irr/gYoJFhb7SRV3sNr5IflfkiTuf0xt7E0MIf73pVHj22h9qjUlGgR0zr5R+C9rzMgO7C/VAr1xHr5glmSOd9A6RLxNfjGvPxP9UVA0DGOPJhgW1/+G5OxZcNbuVV+15eztXAXAg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777745697; c=relaxed/simple;
	bh=xSI7f0SZD00wrt8uQemjvPk7J0SwF3UFfXp54b5NrNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E4cdMw3c1Hs/UOczG/lMveEaZjy0SWZDTjIqSfheg7PJVutWwSV09pGq0BI5TxiF8prv+Y6YGe6t5DX9oro66+Zn0zWPXP0hjUhSPBXHb0d2HSnjbrAp6LVF67hR53FklurpDxtb0T/1HhTb+NTDERrm8ifMxSmik1AVL/TitEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rFz89cm4; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rFz89cm4"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2ef84d016d9so2591146eec.0
        for <linux-hwmon@vger.kernel.org>; Sat, 02 May 2026 11:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777745695; x=1778350495; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mkiFksKvIadq8no8PgqjvPSzP3seuFA1it5PlBXi3zs=;
        b=rFz89cm4j+KmiFbjFCcLKoPrRDRcRPWxgWFuemld4684g+xk2f39R9n88xvkq1UOQJ
         jrbO0CZkXlt+IxFyP7OjBdXr12d4XPJiyx/S5T6T0jl20o/ewSN/sRPn8oAcyXKwvsrF
         fjlPd67rFHSClyuUbZ15kEdbGO5hPBcPlR+P90VYUC3Nhb9rSA7hQEvY9795xpxPOqjV
         Ai4JvHPtHK5Z3ds8VZB39vz0kb/BKEKHkF4EGwhhx9yOZ51FkkiqePtCHdu1PSRa5jFH
         hffwH1ojs8qapFyhtmWWalyEExdMD+fZ5J8fOILWNz3kWBd4i0lzwNsvXm/EkCb1SBzS
         1WCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777745695; x=1778350495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mkiFksKvIadq8no8PgqjvPSzP3seuFA1it5PlBXi3zs=;
        b=gbIP3JID0Ai6RJWMcVccS8ymV9CloeYmZPap7w7OJr53WFYJQKLp66Roitj6Fauv0R
         CbntfRuyvBV1cCQPO7wPbXd6327TxDoMk4UyxFuHNa/fAKUJXDeLM4lWBiS0BTDP9IpG
         M6DKN5k32C+6nS0r1/5xYCoK/zj9HCUb9nNo1/AgZ+ZZClw+/VgITHEYsc1Px0HBNVh3
         1PQmZAPmrYf5Dy3PNN4BeGF7jl8LW1Wl2ssN3edkqKUzb6Cz/n0WOg5Ue6XBvwe/A2O+
         yQTkE4yZIRSmhYX1MRKph7WWBq4yR3M6wh/sLsizdtgcRqYgqmYh8s45KXZjtRxwEb7G
         sZIQ==
X-Gm-Message-State: AOJu0YwnHAC05r4nNxYifrlmiyzZ6cjulCc8zxip8kaXVPhlUWT96Kn5
	wMM5mRQoRt4aDiCnfDhARUx12kKMxABqGSIYWCFdt8UZU0MONjJxlTFvHsIPWw==
X-Gm-Gg: AeBDiesePlJe20cGvNEzx65C4Kva2H/nhcSLhKHn9Sii4f4dYB5y4dNDxGrvnZzgjEt
	yxDjiiu4c84Ko0+AV794PO/nxFRcTBTsi6eshYST5E9G6OCFjzvzy9Znkxsyk0AtJocDikzmTec
	Mf9FIvTgfWl6nJLMDKxcM8BeAiy7HiHNHKo9byzap0LqLxfV0R9BaPZpdnGo5T+VRsBkPKQLQL7
	6BA/UCTnL7CWSQorhW5BrxjryVrlhCY5vMUbva54cspSZSQwV/+oMO6FhhNE2m+7yr72bQpF6te
	NqWLh/+rZmKMrxvXAvGo4ma8437uiLQvVgnCjbY+zIqMLuE8DJi/LvgHIDr+SHE7SjkX7rnjRYo
	jaLpKWI69uxa8jD9yzpdpNhsTAsdp2Q3fB2/TiazujhpTllzqIQa5WmlCtN+7fh6Jou7XDyTKTC
	8i8/IREVh8qJm4h7H9l75pqwwPwcKXjsXqwXiRYLwfttxt6Y8=
X-Received: by 2002:a05:693c:3111:b0:2db:2089:460f with SMTP id 5a478bee46e88-2efb999ac57mr1642562eec.19.1777745695428;
        Sat, 02 May 2026 11:14:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3b29b2casm9252688eec.14.2026.05.02.11.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 11:14:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 2 May 2026 11:14:51 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Markus Stockhausen <markus.stockhausen@gmx.de>
Cc: linux-hwmon@vger.kernel.org, wsa+renesas@sang-engineering.com,
	alkuor@gmail.com
Subject: Re: [PATCH v3 2/2] hwmon: (lm75) Fix configuration register writes.
Message-ID: <dc90fe56-8ffd-4654-a7d5-0d7a57ee0a85@roeck-us.net>
References: <20260502173207.3567876-1-markus.stockhausen@gmx.de>
 <20260502173207.3567876-3-markus.stockhausen@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260502173207.3567876-3-markus.stockhausen@gmx.de>

On Sat, May 02, 2026 at 07:32:07PM +0200, Markus Stockhausen wrote:
> Sensors configurations are defined by set and clear masks. These
> do not follow a consistent "clear mask is a superset of set mask"
> rule. This relaxed definition breaks lm75_write_config()
> 
> static inline int lm75_write_config(struct lm75_data *data, u16 set_mask,
> 				    u16 clr_mask)
> {
> 	return regmap_update_bits(data->regmap, LM75_REG_CONF,
> 				  clr_mask | LM75_SHUTDOWN, set_mask);
> }
> 
> Basically all bits from set_mask that are not defined in clr_mask are
> dropped. Fix that by enhancing the helper to always combine clr_mask
> and set_mask into the mask bits of regmap_update_bits().
> 
> Fixes: 6da24a25f766 ("hwmon: (lm75) Hide register size differences in regmap access functions")
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>

Applied, after fixing the Fixes: tag as seen above.

Thanks,
Guenter
