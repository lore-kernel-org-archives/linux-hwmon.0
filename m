Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA103F4DE9;
	Fri, 18 Sep 2026 23:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789774660; cv=none; b=ojj+WgZb+56ufUEl2yJRYchqd8yAhh5eD8Bc2nl/mexPRbetqjS6nPm9PeChuSdu7hWc1qn3JFLMO+5SycV/D3CZQWBsrW12YScOOcaiJB64/OM83Q2zlUp2N+ZdfJ0b1aFojdfuS4Mj+QeGFRgeMoEGE9tOdr4IJTw0lKg4rZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789774660; c=relaxed/simple;
	bh=rz+bG39Va7yv27zHT3uxR7LhwgCrRpi/EXPF/ocY0wA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fzKDsqoNtosS3MprWFXO7gEAAiCVpynxE35aVBXs/oSEGXQ4V7biD2vUYrzwmP9QhGSm0JQz3Pdydf60dvfh5TaE1zIZr38AaWzffw9VP2b37X0E++Fi2w82mjms29STquBWvydS4joLlbqbS599ffKLBgP5BZDf4h9zYxLD7J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LcBNvofM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LcBNvofM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43BB41F000FF;
	Fri, 18 Sep 2026 23:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789774649;
	bh=5XuFo9Hku9AH+B9//W0dXYAF+SnmgYlyyyq0dIrSUxY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LcBNvofM9VVzSc1HZsyvbKKWDImSzsKjs1JoIFMhkVKhOurf+nocUiTUxYqHqPH0v
	 ksBYpb+4DQZuz5SejlfcCX075n3TEtdysB5WyUFebSZwGLfT4CHBRGjHm9Kdzit9+d
	 sm/jZ4kvNyfB9D4OINqYSmA/N8Rj5mndSGLYBoLdo2O5hFGIXAhSFlapCLNfr55FO8
	 NRgWHoUGLyrP+WvaN5kq6yMQ9JpfEXuCKzsrvPJr6Mjb+GkZRgZFWQNwnmpeslH+7K
	 VfLao/VxMG23wBsuEQHr2y9yZp4y0x2HuIabylG0LoraDsKysqG+osfCv6ReVmtTxr
	 j6Q9ViDirWiEA==
From: Yixun Lan <dlan@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Troy Mitchell <troy.mitchell@linux.dev>
Cc: Yixun Lan <dlan@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-doc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Jean Delvare <jdelvare@suse.de>
Subject: Re: (subset) [PATCH v5 0/6] hwmon: (lm63) Add Sensylink CTF2301 support
Date: Fri, 18 Sep 2026 23:37:22 +0000
Message-ID: <178977450889.1115058.13731797621841664029.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
References: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 14 Sep 2026 16:03:52 +0800, Troy Mitchell wrote:
> Sensylink CTF2301 is a system-level thermal management solution chip.
> 
> The CTF2301 is an I2C/SMBus compatible device featuring:
>   - One local temperature sensor with +/-0.5 degree C accuracy and
>     0.0625 degree C resolution.
>   - One remote temperature sensor for external diode-connected
>     transistors, offering +/-1 degree C accuracy and 0.125 degree C
>     resolution (temperature range: -40 degree C to +125 degree C).
>   - An integrated PWM fan controller capable of operating in two modes:
>       1. Direct-DCY: Open-loop direct duty cycle control.
>       2. Auto-Temp: Closed-loop automatic fan speed control based on
>          measured temperature.
>   - A 1-channel fan speed monitor (TACH input) for RPM measurement.
> 
> [...]

Applied, thanks!

[5/6] riscv: dts: spacemit: Add K3 I2C6 pinctrl state
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=97bd8165a3f734fe97664e186406686bfa34f42f
[6/6] riscv: dts: spacemit: Add CTF2301 on K3 CoM260
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=ad17d98848df3907d6732673a139e9ed832b547d

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
