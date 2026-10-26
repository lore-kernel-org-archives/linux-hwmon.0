Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792974192;
	b=WWiN+z7A0S0WgYdaHWLy+5Kbx2Ne32LKxVS68ThRPbtB2HVcmHB6xxXzRgdXh+uQS4AI
	 DVL5wNS0RtCFcdA6o0XwRxJ68wINXkLGexzFnSbzZsjcdXbui5+gmmNOL8eF0Wv9fQx6/
	 dz6z3Zv9E+YX6t/r1A0bl2yRVvClz3ukeqTtCXQnX9FpdU2shTmElQbSlyjO5JXtfT61T
	 fxKTATYo7birZoWPHRjZVGMFXne7lpzH60xcBaUvxlLHP4HuSmBRbK2Larz4pcBPrfpg1
	 YXLj0et2KidRbyv1YIZx/QMN5Gmdwk1rM1Nisk9/luZ/xxYfa2YLLj2/rbXArGaL4Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792974192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=epcB0hTiu30Ay9YCdkZT2sgsaeYosE/fH0Ud9BHE6pY=;
	b=a5jhWYBJhlOrC9pvPG61FuXp1T0ECu2JLtTdF8G2jP75/JblI/RsqtvCrbpj84oxiP22
	 FhirOKrVcqGmdOhMnKBTM/MiVUTNNbbzV39/CnCZMOycF8wGjcN5EzUxL654U/L77wHFA
	 DwFBApblBftboEeED5yweujrCLNbHzpmUpI2g5l9QBmHNi4B+yQEeYbIPnKAhi5uTKEyA
	 WF9v7xMBryJtU2Emhspmbd/2U60Y7kNIYbrNQWZVElUcbAJmj1M7FdB77JrND02BUx67o
	 wXkAG7U2g21fcmEBpWieOZ63pjOK7nZqY7VRYd5AFbp9Aj7JR7GXET2e1/cyoBTrW3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=evuX6trd;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65F2606A31A
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 00:23:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E65F2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=evuX6trd
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so967919b3a.1
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 17:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792974191; x=1793578991; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=epcB0hTiu30Ay9YCdkZT2sgsaeYosE/fH0Ud9BHE6pY=;
        b=evuX6trdavY+rQ9hdPiLIt32D3hJt9DYx00L6w8OmzUs22ucw02BNil0BHuuMxkhe4
         8fm689/990j230sqwymJwa3YjRqx/kNmw3Li+TMTM+3ABPNfbLRrc9dBJeHRTxQwa9qI
         jwOH7s7dPgf0yLY4zdCzUv5FSlyj/Y2sRTrHkonfcO3whO7vzcEAOoiMbXiXY5cwSHje
         gP8UzQ3lo+8wkTqA7o+fgHEamuHpNnctKrVe8MOGUG9qvYryv1kB0HJR8455C8wTtwNU
         Rodyo+x7mygqkaG4PSajSOABavski4++afbp+dLQT73Bk8EJKP3qegP9DeV8V7swTJLF
         txpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792974191; x=1793578991;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=epcB0hTiu30Ay9YCdkZT2sgsaeYosE/fH0Ud9BHE6pY=;
        b=DlsSGknZ9lvnHflT/I82SoyjLZ+m/4qAyxsh8a6rGB3FCeIJpxGqespGrw07TrXYlM
         TDjITcn0Tuj6jreQzmMHojZceaPFE8WsWfE4UiNkH388gjDmvNSNnq9TNEq9ey0Kxb+/
         a65NjnadUx29H0vbFzz+C4QiW6K5Y0j2ZFdrkRkaXVVJtgKgoqERKfWnrFMmyZ39ouXs
         9pWpy0IFyvT42hiqsqHcZqiWJHCNEaVkcODRhWAq0kgMVEfVOEextecm7Q22wytVaR66
         srAZ7IKyJOeQmJVM1gkud5rZ6Dd07Al8izbGSUYyiI5vBN4GvW8nO+Q/haho/+MSysbm
         ogTA==
X-Forwarded-Encrypted: i=1; AKwUvByrP8sqQ/eIVIjzgRm+lfJWL/gByxuZ4lJzUe+Z8HO20fTtgzxxM25AtyCuiwuQNdJ0ojJ72XDwUzOBmw==@vger.kernel.org
X-Gm-Message-State: AFq9FYL9EnE6TYk64VxnWZjZ6PuclVYx4s7FoWIKoBuznWZiXLbVdGd2
	LKQOSAnXm6vEvKVtWysX9HUP+vfIGB9ZbH2tkap8BFP+PG1knXl7JN2t
X-Gm-Gg: AYBFou220Vm86Ru8Lz2FpXQxppB5b9nLpWovOQp6sxsCLlFW3OrqzC0EZ8h73rMu+91
	X3L3ZDBzlpjuNnwRoFu6bZ90t42MAr3nBrvH6YLFaKycxEb2BkcHFW6pL0wv5scD5/86AC+p92u
	FrG1VpY6RlfbwS+iPGGYayQqFauDw+uQcjfCoiAlF3YVXV6wT9OQEvXSJwl1FDddHwBqkwb8EGA
	fNssJwVcpI7JcnqWhIIuQjZqjv4o+xVakSIMS3bNpjQ5wqHvNE73QovZRz27idpTx45WsM3CHV+
	Km8wdSOpKiKgplQ1j7lLJw66pS6ApF3cUISEvS86G4gF/tohdMubENHCnLuK/gUkgqMTU3ISfGU
	PgXZfBaY3YWvsY0ufSCJPSWHgloi4oO/AA0HPLzldcvcMf7W3UFK0NQzafqE75xTF4hOvmx0vLJ
	7dJ7TSD5Y/mnjS/6y0dSDgeRVpsTuwA4itqNIZjUEkIO/oseb9t3mhOlNhJgZOe1rPgkcVHxWUv
	7zbD+ZYmAg0cdydRI+S2qeoyljfnhN3DvlZ25OXnHkE2j7nz0yTABhmucWQzWrWRyqMxpXh8Qhu
	FhbEH0mSs/OOLHI=
X-Received: by 2002:a05:6a00:1889:b0:899:529e:dc9d with SMTP id d2e1a72fcca58-8a36a6c5c9amr2879726b3a.1.1792974191295;
        Sun, 25 Oct 2026 17:23:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a368d85e22sm783839b3a.8.2026.10.25.17.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:23:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:23:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org, jdelvare@suse.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: hwmon: lm75: add MAX31875
Message-ID: <4c365f2e-8dd7-42f7-b96d-a57daf23bc53@roeck-us.net>
References: <20261023091550.1494-1-johnerasmusmari.geronimo@analog.com>
 <20261023091550.1494-2-johnerasmusmari.geronimo@analog.com>
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
In-Reply-To: <20261023091550.1494-2-johnerasmusmari.geronimo@analog.com>

On Fri, Oct 23, 2026 at 05:15:48PM +0800, John Erasmus Mari Geronimo wrote:
> Add MAX31875 compatible string to lm75 dt-bindings.
> 
> The MAX31875 cannot reuse an existing lm75-family compatible such as
> adi,adt75: it has a 16-bit configuration register (instead of 8-bit),
> four independently selectable conversion rates (125 ms, 250 ms, 1 s,
> 4 s) and four independently selectable resolutions (8, 9, 10, 12
> bits), and reports its alarm through a different configuration
> register bit. These differences require dedicated handling in the
> lm75 driver, so a distinct compatible string is needed to select it.
> 
> Signed-off-by: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
