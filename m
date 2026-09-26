Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4571F302146
	for <linux-hwmon@vger.kernel.org>; Sat, 26 Sep 2026 03:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790393257; cv=none; b=l6eGaWiuUxOCaBh6IxwbhkQ8py1tRqSKdv8AwqjRuwoxYG3DOh8O7s6ezeDfQKQOE9gWmuWLePwOboCoJ1s8aYLu8nIXuf4QaQR6wNXKMZVY12ZYsKz9T2bY1cgUX4T8T6uYiAby+qi1oynZSIaoiSY7E+cfT2/8nH/mL5qJ32Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790393257; c=relaxed/simple;
	bh=Z00kRkwUgtsawgVeeFWkwcXCWA8qGxR2LJeXa+w4uWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bpnqlqrmyly4iQ76K22oVBLat3Ygawvh/NMsftBRXhSt2rnauksMozpZRG3GHpRMRV/wKTpxgGerb3F8ndbsZiY3zavDOWC2pdHMPJjP3nSiKXFM/sMOGDhXVocqDk+oXYJ/qrR0VSzUaHi2BkApWhVAGDJEkMb1f0/AigshJMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sa0OZ6ZP; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sa0OZ6ZP"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccdaea76so514534a91.0
        for <linux-hwmon@vger.kernel.org>; Fri, 25 Sep 2026 20:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790393256; x=1790998056; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lyN5PLMY0mV6I5W3KVBKeXXiOfziPtvjSCw57/NTGJM=;
        b=Sa0OZ6ZPwQG8PdGAmdTL7IehXsYumUnj9BLiUcvMNoOlY2uSVCBPb2ed+Clv5H75VY
         m+2+OK9cIFCCYmred2VLfEhoHkOPkSkTOQlQSMIXsnd2d5qH5jqnJlfTpg0X8Ey2GZO6
         t/U8FU9tWTVW9Gir+X37IKujgklCfucJZV3YN8gzKd1KikQacG1yiWWRkD0P+kkQCMx0
         PJ3HPLSgOyW3cTh83YXfGQkOVhafPYoSMSu1e//yCUIeH7VtXUHSZmi2XVlf762rZHz+
         zf2+b4icBD9Q4mxysLxHId9wn+c6IwVda116dBa5/RMttaRlYgjVSKGSqgp7nWxVoEb9
         lQqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790393256; x=1790998056;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lyN5PLMY0mV6I5W3KVBKeXXiOfziPtvjSCw57/NTGJM=;
        b=BxZjoM0ptpGOy2DLxxqs1JSOxyEmmhAyHwPQqcpvBrcOWKk0hQFmzn1z6k4bx3mSU+
         5PZAr8nb3Ub1/zo88kBW39TCxqKIp18kj7Pd58H6x4F+ZnhCjzYq9820/haIp4LTWRmd
         HVAcbMtqIJCKa1+XIRk34qvmp0nWr1iIeDypCCa3TNe8/UZG1jlxx/I1nOlWwnXKsN/P
         nBjWPIHmYz0V5yKwOvfw//sVbR+gsO22xNdraBl/diuenHaFz0xiJNCKUer7dfkqR1kb
         MJ8Scsa5vzrfy8wYn7qHE3NhRR+REqNzfBeaKgicyoRb8i00lZK+9RLfIjFgmGlhl6z1
         Wf1A==
X-Gm-Message-State: AFuF++nqdSqDUYj/p0jAmpFPv/+bsnMKoPE/iqOnKtSesmVQiiLgEt0I
	X2ZQ+CIKCg2UiH46KPxUMfeh2oRvcitJKQVadL5UlDZMhZLjp76/Dr54hqUWba7g
X-Gm-Gg: AYBFou0l1Uvd6Tq0npwCnE26kl3mPRSYMCuaMFXV3U8lQwKPV/rf5bznCHBBi/cNBvj
	zYC6BvZpHq6axVVnHbARi4SbKR+8R9GRYFT2ZqRGS2lWxa0CvQ+JKW4oXamUUqdGh1S4eNzHSb5
	PS0WnqFGwgkiuEH6cFgp+MC9WLQ5TSxnq+6o7zNLa9MAflPSygsmXK85E5t9wPCEiQ5sRryxKwT
	nVEYLzFmw+pfuBGI8MzOt+4MubRXrkhgbZeVz8Ix7q18wCEdsbxZ/DHNdD2gIDEYCoKK4pCRBXe
	lRCztz3MFNpIbVV3vAX16zPvHG/Ar3zPbxcvNKiq82ajnaUrrdVLGfxh3W32r13M05ulg4rdJB/
	SR4ysvyyUDRezIVNAQH6EaYmgQigAyjX05HVHkaepne2vphk1Acxa6EtV2nyV9831XqN6UwPS03
	XXfXVI/HxVUAmxtQKVo7mMoAXYDnog2SPvWFfGLOMthCE5otbh01tcgXZLRnjwFP/N1uUtbqLt6
	LM1YVJUCosg
X-Received: by 2002:a17:90b:3f8b:b0:3a0:ca05:a09a with SMTP id 98e67ed59e1d1-3a0ca05af35mr1613646a91.4.1790393255542;
        Fri, 25 Sep 2026 20:27:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9feddd0sm2495455a91.2.2026.09.25.20.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 20:27:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 25 Sep 2026 20:27:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tom Verdonck <tom.verdonck@inspiral.be>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Antoni Pokusinski <apokusinski01@gmail.com>
Subject: Re: [PATCH 3/3] hwmon: (sht4x) Fix jiffies wraparound in
 heater-ready check
Message-ID: <ece4eaef-0f72-40d2-9442-fb7e5154daef@roeck-us.net>
References: <cover.1790358356.git.tom.verdonck@inspiral.be>
 <7b2087ccb963e097cf3f6333efaec0c46549003b.1790358356.git.tom.verdonck@inspiral.be>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b2087ccb963e097cf3f6333efaec0c46549003b.1790358356.git.tom.verdonck@inspiral.be>

On Fri, Sep 25, 2026 at 08:23:24PM +0200, Tom Verdonck wrote:
> sht4x stores in ->heating_complete the jiffies deadline at which the
> current heater pulse finishes. It is set once at probe (to jiffies) and
> only updated when the heater is explicitly enabled via sysfs, so in the
> common case where the heater is never used it stays frozen at its probe
> value.
> 
> ->heating_complete is an unsigned long compared with time_before(),
> whose signed difference is only meaningful while the two values are
> within LONG_MAX jiffies of each other. Because the deadline is frozen,
> jiffies keeps advancing away from it, and after 2^31 jiffies the
> difference flips sign. On a 32-bit HZ=100 kernel that happens ~248.5
> days after boot. time_before() in sht4x_read_values() then wrongly
> reports that heating is still in progress and the read path executes
> 
> 	msleep(jiffies_to_msecs(data->heating_complete - curr_jiffies));
> 
> with a bogus, huge delta, blocking the temperature read for a very long
> time instead of returning data. The heater_enable sysfs attributes are
> affected the same way (spurious -EBUSY and "1" readback).
> 
> Store the deadline as a 64-bit jiffies value and compare it with
> get_jiffies_64()/time_before64(), which does not wrap in any practical
> uptime.
> 
> Fixes: 0eed6fc3d2b9 ("hwmon: (sht4x): add heater support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tom Verdonck <tom.verdonck@inspiral.be>

Applied.

Thanks,
Guenter
