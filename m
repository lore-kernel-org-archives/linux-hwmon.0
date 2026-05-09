Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E28826B777
	for <linux-hwmon@vger.kernel.org>; Sat,  9 May 2026 15:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778341404; cv=none; b=ZZSF6U56oUUSDjIzuzLi5X6CSHBbVLQHc8iYf4TeTW3+Rk6GqRjjsenk5U21p61ZP7gTvXqcmfa1q6j7L2gb98E4rSopjB834llzOxdtUGITxd+EmHyGXIhlQ2nVa10l3SMatr2p0KpO5QRy1CUmW34wo17jX9969OsMhGpUznU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778341404; c=relaxed/simple;
	bh=qZ3p5AG2+MACCsXmmyx9bg5RSvxC92SkrO3C4EqJL4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rhn4G9GraCtX4siTwCrx5j9pwqb2Ot5GJNBPaS0d/TMt3Z63IdFH5W02+c1b3qmSVfTkEu4ly613tokTOkFX/wYhiCgW9mjVGaFTF6KoYh8ZZ/9nLm+eOdW/w0pvv3nHw4pBmzv2SV5ehRskAMePofxt6IBREpKkwrkAVfEljWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F77lzqdu; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F77lzqdu"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c80227b1f6cso1202854a12.1
        for <linux-hwmon@vger.kernel.org>; Sat, 09 May 2026 08:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778341402; x=1778946202; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ghf+v/bXUU4Mfzw7RTvk8pkjl1aXFl87yvIP3L5ZJ+0=;
        b=F77lzqduSXaCzkqppunuhkbKlEIKa6M8smnJHaGaIeawaQ7Tkg+B8Ujl7fEhuaXf5i
         mATerutVvxE4sZcnKlQ2MzkUbGF/Q3jP4ESkwTMB9KLr1U6Se9zpd/EZjECrClop9GdR
         NNXnsUOrWzqLfBpKi7jbm+EHAQDC2ZlLdBBn9w2/0x/HV9yA+BS+gMatuuSJQ7KkZime
         nw404u+C62tO4s/yu9iZj4ZgDR1rNw+o9YGSiY54MGXHFQYrucqKHVo3dvDtSJqIHyp5
         /o2XP75xiVPP//33boPFp0N0ewJVpyu++hiLlMQBA3kcvTZ2j9NIb5PdQROPg8iE9YNu
         3R0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778341402; x=1778946202;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ghf+v/bXUU4Mfzw7RTvk8pkjl1aXFl87yvIP3L5ZJ+0=;
        b=EhtQ8xHs/HKFB8983mLiCSlxy4Ri0C4DOM6xJW/TzUUuy80j7BQdk0dR8HDuJ6WxPF
         lxod/LiQavBXjICkWQiG2vF3DA6yMY0Qd+vzhJ0/845EX02PeINaEh7IhTd5Hw703gq3
         zTDdDkvHgVKtX+zmMnAnC2tpg+nR96XXrOIH8fpSJoeBkCgL85RSzyFhGCgo4XzO5XUg
         hGEWbJBqtdHHadOSMWiYJm4w4Gkf9j65SOoAEUaqTRdAGhM9jUD0ajgkcVGhxKjqEgJG
         7azhyZU4d/4c/K5N5wxQ+lljAs0I9l/sbVVDgK6LOvs6NZmLQ3yz4e16zgYlGQB8aSd5
         vuYQ==
X-Gm-Message-State: AOJu0YwAHOS0ePncQJKxFBZVxd4p66Ozq2TXGeAuHukHMb3F1adJibid
	x7Z7Ta3q59f2w41ztAwdem2WfKR7PDNnNwLkhFddcpUu712gEhCe7G7zaMH2jQ==
X-Gm-Gg: Acq92OEKhJQ0u1yNXDjayy8vBTU5g7o2zKFHqHCCvBTIBWD8tJMJHs/3Y3ex+pwdFR9
	R7GD+1jp3z564xZRfZGkCM3hAjCfZRoxVExvMQtI/+xA7d1NlJDtUoRi7YN4h8UDRacwTU0zi25
	6qBTpo7g2gqJxxlUcacgma39I1SfMbTkbEPbOIP9L6gfxexNrnm4R92WOn3M2DhiAXSUMJXmXu/
	svcWchKjOTX0EhYO2e+4t2Thb9LoGo/MQ3/QhHrNww7DeTrMWprsw6LdC+stjBGG5t/8Y23B8wm
	a0JxE8G46unMEBmihBGM501TazEoAXSLJNrxoNREmpvB26agPbM3aLnRRf+V/8LMnkJGAyeEuzR
	cluTF8wiwWg7YUMfHjiABTSK9QPR9JHR/b8hw/DsXoktV4mb+O8tzEZrZXQkAd/KQGjSnYj4d7Z
	w1wDb+dUOctJtUP0S7gD5IPrgJUmcw4nyWgHa+
X-Received: by 2002:a05:6a20:7fa7:b0:398:b433:87ed with SMTP id adf61e73a8af0-3aab17e8acemr8336221637.44.1778341402483;
        Sat, 09 May 2026 08:43:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826767be49sm4686725a12.3.2026.05.09.08.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 08:43:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 9 May 2026 08:43:20 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Aureo Serrano de Souza <aureo.serrano@arctic.de>
Cc: linux-hwmon@vger.kernel.org, linux@weissschuh.net, corbet@lwn.net,
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 RESEND] hwmon: add driver for ARCTIC Fan Controller
Message-ID: <839d67bb-79fe-4096-965f-ead57112b3a3@roeck-us.net>
References: <20260508064405.38676-1-aureo.serrano@arctic.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508064405.38676-1-aureo.serrano@arctic.de>

On Fri, May 08, 2026 at 02:44:00PM +0800, Aureo Serrano de Souza wrote:
> Add hwmon driver for the ARCTIC Fan Controller, a USB HID device
> (VID 0x3904, PID 0xF001) with 10 fan channels. Exposes fan speed in
> RPM (read-only) and PWM duty cycle (0-255, read/write) via sysfs.
> 
> The device pushes IN reports at ~1 Hz containing RPM readings. PWM is
> set via OUT reports; the device applies the new duty cycle and sends
> back a 2-byte ACK (Report ID 0x02). The driver waits up to 1 s for
> the ACK using a completion. Measured device latency: max ~563 ms over
> 500 iterations. PWM control is manual-only: the device never changes
> duty cycle autonomously.
> 
> raw_event() may run in hardirq context, so fan_rpm[] is protected by
> a spinlock with irq-save. pwm_duty[] is also protected by this spinlock
> because reset_resume() clears it outside the hwmon core lock. The OUT
> report buffer is built and write_pending is armed under the same lock so
> that no reset_resume() can race with the pwm_duty[] snapshot. priv->buf
> is exclusively accessed by write(), which the hwmon core serializes.
> 
> Signed-off-by: Aureo Serrano de Souza <aureo.serrano@arctic.de>

I guess we can live with the potential 1-second sysfs read stall on driver
unload reported by Sashiko. Applied.

Thanks,
Guenter
