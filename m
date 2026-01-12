Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010DB259C92
	for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 21:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768253645; cv=none; b=Xr6o9M8UpM41DLpGPMb4mDzt2xnbSvZCiBw9VWPmRNNq36FE9Q2x2l83VU2Ad9WqB9hKmxO7Nv+VL4zkkQHaORZY9cfqoJuY/i4FBB7tT+ZzGkyErylRn9/ypaBvJOvf8G4LGENgrCsFedVGZKNgKx/QSh/pModmsQ1i3TzYsu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768253645; c=relaxed/simple;
	bh=IBsuJz7g/5Cbw14KJVDoyu/IgchopG5K+JrKpWKgnLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ekS1lcqBYYsyvSIg8eKMRFsmwADseIIjOGv9REUAILofzye63sVOA1S6530m25tpb+93p4irw0fHUxMBBno4O4zo2LYo1aL9lPpj9TxyYXHYw0/gZKpTgrKpKtPJE101vQqSM6XQppAR1vQBEDXaLjfoE/ypGg8bVz/rvbC3hpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YpCiLO3v; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YpCiLO3v"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-11f36012fb2so8994908c88.1
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 13:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768253643; x=1768858443; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=auFkrO/B7eWS//mYjZbhnRhxh8w56WCPQXTuiv7AvpQ=;
        b=YpCiLO3vEmkAP8GO9uXeYPL0O6e12jHpdZYIQbHONnoKkoIhxh4M1SgIFAGnpztG4f
         JxwtV/RONncH4RLAxQnEQMFw1Jtsv/L1R/U8WY0k68eYzujZrM6UUl2P2KRwjsaPsxq+
         OOFfPnRLtTCQXtk2QdhI0SGtHn4NLk/dw0itDWpMupKzbjLj6ychm3XrNMQAJgvDnox5
         h3WNsb74w8E3O1+zNbW4RUHMiJLJCdP8SU2xyT+9jSzHJQrtb4FAhHgiaRqwjgL27Q/g
         zFmHl9XQurMgYPqEwAqeH8kU/8Hd+vYoQ9kHkc1gQEV8KvIDGhdzU9/2P7eqRBl87b/U
         vwEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768253643; x=1768858443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=auFkrO/B7eWS//mYjZbhnRhxh8w56WCPQXTuiv7AvpQ=;
        b=QWmI8xvV4qixM5vg4p/gMK0kxcsjlNbj86wm/cN3f1May7EAik6C0U2nlMPmuxc60I
         ysS+5Rh8GJXvXyCiFcm/V3xtJdRXUZx2DgjBHgSi+H+htMWEUITV90cWwNV2yj5snepQ
         w9tkhBEk7rkggyJ+R18AcdjVLVlgWbS3+cv+D7xZGHZTVzJ3zxcD5kJSwdVDn1Gfh1LL
         KKJKbU/CJhkpYBLESjvnq0WLu1X5qJyjPoO/865yiwdwZTnsRUOF0KTAcEt++shCPYMR
         VRKgUFqIQFRmiWCoxiDXkCS2MYF6KEaRT9xIn8672mQCwEnaQh2onvWF+w4mnP+SVrhY
         d5uA==
X-Gm-Message-State: AOJu0YzTlBEigKaAt+OYlvjSCcaNdypCJ3DGfBbOZjA+gnFUYPKRoCZy
	JynvMqDbw/w+7LuSaKVAFsLzti5haNrIiP6WOM+u+ELQ3JDq61sj7hP3awqfTg==
X-Gm-Gg: AY/fxX7jSin+3XS6jSnTKpD7RH1Z2pn2YlJKFe6T1YfKDUA4YXBShHnPgTgp5E8XCI9
	17gD1Tf1XQLAi07LAz4D0612YSRbSA3j1RoCBKQ0528d/+I7fYdywbLW6Yk2fO9Kt2s/dSA7KUH
	IZfBGdlApVaWTyKtuyGH6BQePGCb/jsuLB5X4IufxGR20Kh8i2345TOFAfS7lN65mrztxjOUlNG
	d4SmVxoBQVcdWko7ZbuVO3kje8HE9ZKoUxvI+j8xncwwyZsUh+ogSP+Sr96z98FAS1yeVczwNjH
	gjQ/TH/AegBYKYQ4f24frDt0OWXtAgBBBhtItQQkwjybv9wj/WadxqD6a6T6HikiwiMl+rDIdjY
	Nr3FxPwSm43YD0T/WlsMXEnKQqbjO+F4uaIZ4ERsaY9zc2eh4vctcGuVVUXoXTfEuKsXpGj4uPo
	3S4Dx5PDYoLaGQrHcd7lt6SfvoPwsksBbOBFg=
X-Google-Smtp-Source: AGHT+IEQOOhSNyJfPru1LTZJGk6TBpqJXo4Te1vtGVcxF3mlsPLFFzXvS0ybA/dptNTxaDGo/H8Uyw==
X-Received: by 2002:a05:7022:6993:b0:11b:9b9f:4283 with SMTP id a92af1059eb24-121f8b46117mr17591284c88.24.1768253642936;
        Mon, 12 Jan 2026 13:34:02 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f243496asm25092153c88.1.2026.01.12.13.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 13:34:02 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 12 Jan 2026 13:34:01 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Anj Duvnjak <avian@extremenerds.net>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (nct6683) Add customer ID for ASRock Z590 Taichi
Message-ID: <98104df9-0ded-4085-bcd7-9eaa0091c0aa@roeck-us.net>
References: <20251222220942.10762-1-avian@extremenerds.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222220942.10762-1-avian@extremenerds.net>

On Tue, Dec 23, 2025 at 09:09:42AM +1100, Anj Duvnjak wrote:
> Add support for customer ID 0x1621 found on ASRock Z590 Taichi
> boards using the Nuvoton NCT6686D embedded controller.
> 
> This allows the driver to instantiate without requiring the
> force=1 module parameter.
> 
> Tested on two separate ASRock Z590 Taichi boards, both with
> EC firmware version 1.0 build 01/25/21.
> 
> Signed-off-by: Anj Duvnjak <avian@extremenerds.net>

Applied.

Thanks,
Guenter
