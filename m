Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1242315785;
	Fri, 15 May 2026 18:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778870329; cv=none; b=dQgxwscEHBIkWOrci20v3BqPpi+XkIS7QlznPP1oO0FHf8nbZj2tv20JANIvy2CkELiRspF/6CtaXsnIxy4Qx7RdNf1z+gYYYJDIvenQcADbpElisGGXKQjtfpReGsizOL+5lGngZiTQa9C6Rtu5ORtKbKFaTmKZ/ySzfxqSLzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778870329; c=relaxed/simple;
	bh=+wPymBEe3TxCBRnJQzdVh5eK4hMM2TTTmfz+GgHExLw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GwlfoMIzbBYwXDw/negdJhd4+RlBN6j3yJuRPB1N19kh331e77O4/Fp0MkieCrxNpTn9PP1gFcBNqChcxMVRhD/CEk0qlqUtqkpUmdXUtCGMTnIgEvUwcaAsNZeaycVPwjOa45QFPeaGc3An4lKNi1bV0UzNhbjCDL89w7oFLis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=niZI0IGZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="niZI0IGZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8091C2BCB0;
	Fri, 15 May 2026 18:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778870328;
	bh=+wPymBEe3TxCBRnJQzdVh5eK4hMM2TTTmfz+GgHExLw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=niZI0IGZZAPZfNsFSSaO8Y0xZLzl2mGeYGfjYUJxWV6gXlxLk6DS7k5IgeOOdxAmb
	 GhLwEbZ+wjovEKpgdJQDbNHWzq2TQcejabDCVm+rQjjpigLjclkTFqY/eLrnbRNfT+
	 bU+oZ0K/XXWZgxSGeQafyl27PBIN/u8dF8n4ZbFiMDmYIJ/ONR9cGFWuLCx5A9fNNF
	 G6jH6W5nYcHJUROve1jTQswIMthEqVHJxSCyRTwLOJo1Hliu3Z7TPuYlmhKT46xWpW
	 L+O+iNf41fwGBWnTPtve5H7UjNz90N+B6cd1sbapbmWseWO1DGBE+CBDcUrQ27numq
	 52no2hVvfLB8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 5/6] hwmon: add NXP MC33978/MC34978 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleksij Rempel" <o.rempel@pengutronix.de>
Cc: devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260515160537.115808-6-o.rempel@pengutronix.de>
References: <20260515160537.115808-6-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Date: Fri, 15 May 2026 18:38:47 +0000
Message-Id: <20260515183847.D8091C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add hardware monitoring support for the NXP MC33978/MC34978 Multiple
> Switch Detection Interface (MSDI).
> 
> The hardware utilizes a clear-on-read FAULT register, but physical
> faults remain asserted as long as the underlying condition exists. This
> asserts a global FAULT_STAT bit on the SPI bus. To handle this without
> trapping the CPU in an interrupt storm, this driver implements the
> following architecture:
> - Requests a rising-edge nested IRQ (IRQF_TRIGGER_RISING) from the MFD
>   core to catch the initial 0 -> 1 transition of the global fault state.
> - Caches hwmon-specific alarm bits and calculates state edges (XOR) to
>   isolate alarm transitions from system integrity faults.
> - Implements a 1Hz delayed workqueue that polls the hardware as long as
>   any alarm is active. This compensates for the edge-triggered IRQ by
>   discovering secondary faults that occur without a rising edge, and
>   detecting when the hardware clears.
> 
> Assisted-by: Gemini:gemini-3.1-pro Sashiko
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Reviewed-by: Sashiko <sashiko-bot@kernel.org>

