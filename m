Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792975870;
	b=GndRYuBiaDmTjggrj4twG53xrDrWTdpfl7bkOMZoZjzQEEqNDYiEK7TTly9Unbd6vxEw
	 Xpmeb3geGgCCQyRnUowf6VVkL5BhGaXZ6lCeyACRiXuJt8ycFLOY1iVjfdoP5iXPVwAl7
	 J+T9XyIRGjz2k1jK/AHr4OnZWe2KLOJBXZFilOuZ3hjdVdB1njN9awCnRFWkIWvZvtRV2
	 tK/2hM7vjynd6SZEHo00j4pdOF+tbE3LTy1gCl3FN5jxV5zg45ViZzvYBsiXlxXVgqdj8
	 LFob9KB5y7E83tUuC3weoVh2xJu9syNVhEC6cx2mxoaZO66T5kmaFrJd0xbrmQwCERg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792975870;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Sender:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Fw4OAzCsdOYgHRAHfJHlt+nvdrcYhITDk+EYmCB+3ck=;
	b=e6z7B8nP9HHqlJcp4SvlYp1Vl+Y0bBvsm6tY/YcHpLkTrNrLA4yMO3YHf6z0i8hfxOYX
	 AR9YG1OCoSVhdzXw/xytoVhPG1CAUYSaYdIFjykVaBHqbXF3A3tUfgcRypPaYiUuZJaoM
	 Hgbf12vZWv9ijpHmgr0xcvefkfl+XvC6MO1lXkC5V0kMp5NbS5QEvK68eU/jK/iWSgEqr
	 U0QgjLKvdtFpVjgSczM97AXNWGczGPiWhFFFOZJGMJMb1XdGyCB0g6yMy2BorweumqpzH
	 GmFDFn9qI32qG4inKMNeQ9rSXvY86015OVAbQ+cIG7gyhNoJIZp1QyEEzP4/xqGyb2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CkyDCYoa;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D0D606A31A
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 00:51:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2D0D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CkyDCYoa
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e942864693so12760085ad.1
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 17:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792975869; x=1793580669; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Fw4OAzCsdOYgHRAHfJHlt+nvdrcYhITDk+EYmCB+3ck=;
        b=CkyDCYoah27WiyYbB7MVrclRDjNL7eGiG8gLtUJEEKqQng4esFhPWzKxkX8tvhsVT0
         ke92atBveR/DTt1eAJBSjkHp97sdtLZhOoOpjcPhyugxorpHcVVyRaBSYQU9aKXqPGn7
         vWIAm8C5r5tyRxG/dI2l/75ZV3FlTqB6ZPbibUy83iyfp5Cbb4KXYplwc7Zmqy6vPRNP
         CqU+EyAwRzeDM7NthxZuf+8feKygRnsdRETTJ6bMCurZfbcjY85WpzpDc7NnAVBPw3gS
         I03/YhJqccNEVLTlQa3j4vWy3TSFeUcF4iDWA11pOAUwlHyIvP7AGPetuHxf7X7H0das
         hWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792975869; x=1793580669;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fw4OAzCsdOYgHRAHfJHlt+nvdrcYhITDk+EYmCB+3ck=;
        b=gUbuLsjhp1AxnWFSNX7MA2fbyxNs9y5/ZtjVRZj+KwKDxGsf9fe7akB0Ti0b8byIq+
         TFu1+E9W8pTQKmuJeWVt1UsTE+rr8F00oOzODTgzVOMCbyN7r85XIOjKN0cRLvv8HHNg
         5RGawra2Kn4/dvUZ019VR0j4VgFZtgwtETw7DS16JcteAD+Fmh1106g6URFeqInUgRb8
         edmxPT60tH/mt3MVjviz2fTCOJ37gwDC8HMrvKbQsmPij5d0CxQoNnferfd0m7R6Hakq
         GDSVZLshFyQZXfp3zFkArMeLM0o90wBZHTrSR+MRHWE8qAiwiaw7ZIrIL7BZZompbCj7
         DTOw==
X-Gm-Message-State: AFq9FYJNUt5hfoUQF2jf+U9mcCMtZ1UUXUHfMxzC/nUybOwwU65Vt3E4
	zUPASCtABzQnqs/LEWu/OMbqA+qIubukvOUCWEFPldSPrsYxbNIHERumiwAdmw==
X-Gm-Gg: AYBFou0m5Wq5wDqEa/3rZa2iO9pGiXabfaUwB5OZvVbl6RQD8Ant6X52+O3Qckv+HRl
	TX1wgkrM9+dGsk4Pg+nAm8tQKFr2gZy8kupFT4THZTU5FLio5YmTtyhQ7u/CnEnq8XLB08zfQde
	MI4U276/VPKeZ8YQmeT8kBHmxMYjF0ESv8kAiS7evbwgV6T+HqY3qnPiMmbdorGFrJ77ECZCp6A
	87NtQsYWH2AYzG3oGZr+eyv153KdQkC6pFR4l/DE+MeFVJIcs4+1lgP1vVK4jb2tsu82Rpn4uFF
	PJOfhc9eBrJOPzFn8D4bXU+NdDrxlCModNTc3pu8Svj/9hAEasOs17Y+1Rahxan3qEEQmczaOc4
	smGUXY3ZMXE985YgGXR6zRFlLONIrHYul9cQ+H9/AcAL3dk6ORb1gbuo+2wGoQFiYBSRxL5sgPZ
	vaYIx1gY819/be9a3Yp+isml704fAMnbtUGDWg+lajCDMnpc1UfWZdc/o3cWk9G4eH7SlONnVd8
	pnrfo5fI/Puhklb2RNy/qGFqx2Ua1V6l9HVdMagqoJXwGRVjP+r2nbr4JmXnwR/wWAOXA==
X-Received: by 2002:a17:902:ea12:b0:2e9:64b9:a332 with SMTP id d9443c01a7336-2ea9c68c8b1mr48017505ad.15.1792975869020;
        Sun, 25 Oct 2026 17:51:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9af3168asm10879655ad.4.2026.10.25.17.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:51:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:51:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Martin <martinvancoden@gmail.com>
Cc: linux-hwmon@vger.kernel.org, eugene.shalygin@gmail.com
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) expose T_Sensor (alt1) on ROG
 STRIX B650E-I GAMING WIFI
Message-ID: <a1cf3a18-77f6-49e0-bbd0-9f9aae172099@roeck-us.net>
References: <CAB+4TXvUg==zX4nh=KKTZdpW7khYCHVUzaPkBdjrQ2NT5MahBA@mail.gmail.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAB+4TXvUg==zX4nh=KKTZdpW7khYCHVUzaPkBdjrQ2NT5MahBA@mail.gmail.com>

On Sat, Oct 17, 2026 at 12:24:03AM -0400, Martin wrote:
> hwmon: (asus-ec-sensors) expose T_Sensor (alt1) on ROG STRIX B650E-I GAMING WIFI
> 
> On the ROG STRIX B650E-I GAMING WIFI the inlet probe plugged into the board's
> Thermal Sensor header is served by the EC's alternate T_Sensor register (0x37,
> "T_Sensor alt1" in the AMD 600-series family map). The board's .sensors mask
> only enables the primary 0x36 "T_Sensor", which reads a constant 0.0 degC on
> this board, so the probe is currently invisible to the in-tree driver.
> 
> Add SENSOR_TEMP_T_SENSOR_ALT1 to the board's mask so 0x37 is exposed as a
> hwmon temperature channel. Because ec_sensor_temp_t_sensor_alt1 is already a
> member of environment_temp_sensors, the read path returns -ENODATA when no
> probe is connected, so boards without a water-cooling loop are unaffected.
> 
> Verified on a ROG STRIX B650E-I GAMING WIFI (BIOS 38.54) running a custom
> water-cooling loop: register 0x37 tracks the coolant temperature with the
> expected slow thermal time constant (steadily rising under sustained GPU
> load) and is clearly distinct from the 0x32 board-ambient sensor, matching
> the behavior of a loop inlet probe.
> 
> Signed-off-by: Martin <martinvancoden@gmail.com>
> 
> 
>   .family = family_amd_600_series,
> 
> diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
> index e43645e..c4cc0f3 100644
> --- a/drivers/hwmon/asus-ec-sensors.c
> +++ b/drivers/hwmon/asus-ec-sensors.c
> @@ -683,6 +683,7 @@ static const struct ec_board_info
> board_info_strix_b650e_e_gaming = {
> 
>  static const struct ec_board_info board_info_strix_b650e_i_gaming = {
>   .sensors = SENSOR_TEMP_VRM | SENSOR_TEMP_T_SENSOR |
> + SENSOR_TEMP_T_SENSOR_ALT1 |
>   SENSOR_SET_TEMP_CHIPSET_CPU_MB | SENSOR_IN_CPU_CORE,
>   .mutex_path = ACPI_GLOBAL_LOCK_PSEUDO_PATH,

Your patch is corrupted, replacing tabs with spaces.

Guenter
