Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0ED3EB7F6
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 15:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773762169; cv=none; b=s+jUVB02l4t+zmTNp1Zt7hhFCqY+3xeZyLi+4NZ8KpTaslE+jh5nulIe4T7ePwQ7vas1zE2EnaKB0oefdeuWzLOxG5COQFTbRm5HRmOfeLgqWtSE7wvWtXAo3ER41T+HroyNl6/u/Fvn32lh0S+fhriQcYj/c1XQbkbMBRKunrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773762169; c=relaxed/simple;
	bh=YP9ftBgU40ZMDVr7uKljymEYVi3zFdcjpWVQapD9Goo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qxkQRGjiSk/2aaKOQw/xUoKUZBUn33fB9sFYN4P183mmEmZju+gwcsUxrfIT9RZtEi3O53t78x52KNcCSEHM8NtWPdqw/G28sGGq333esKRMHWagCc+mDp+imTzz8kO4MpTf6oTLUDHDsq9t5ahniiZyQTRythHwTQMPQhS0Zmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BxpYt0xw; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BxpYt0xw"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-127380532eeso376842c88.1
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 08:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773762167; x=1774366967; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DPxQhHLsn9trqYK9Nkt3NTHTqHhfajnqZ3m8HUBGCaQ=;
        b=BxpYt0xwk4L9xgh/EwJJCqTvVNnHatgRrcbn9dIMhuudN0lGZ1QVGs1ykCl/RZgV6v
         L5/yHuzlE9Hk5fmY1rNmhJRKUNwZzExSVG5FRdOFkOSVCsRnpKzsvkooMkJjSiN40Azx
         NjcLgW4V/pBJlXjC1qnnYzJj14fK7his1MqEPgqVPo540I6h7S7Jzqyo2ovekSfSchb5
         2W0Btc0rZ6yiwOFJMrMB8s5PNq8T6WzRlWB8QAiviOvIFDm9UbC0Z+6mPoN25nzuuB5y
         GYwG90PnhSjtXAbp1yIYFCtXiiiNRNoYU3WiGqLxadb+ICQYA+krgqrW7FAmtHauL5uQ
         LEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773762167; x=1774366967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DPxQhHLsn9trqYK9Nkt3NTHTqHhfajnqZ3m8HUBGCaQ=;
        b=roRnwZ+xEb8DwPh/DM4WdpU6jVxNt778DcPXnGM4hpuyPrpt8JMImKDzWnra7hyGa6
         x0B+097ll7O5iajdSphI+YiuYt3YZURFFvuKtL5khQB2VxnF2o2fpADjUwwSgjaAITex
         zM1RP80u9j5Em7M/2AQfO6YlSw3fHmNyLvoFourVnewYPambaEQbTE5ES7GtNzZzvNHr
         wjfbwCTc6vD572SspiebCnPHNv92/jGpnkUCnqdkyKDhW/jyjJPj6W6b0mlMDD/2t0+Q
         2njRzoIzHZUCp4PPNSvOzLv04A6JjTjGC70Lw5Km5bHCXolWSWsIG/Tg6FZEf5K5yL4M
         c3nQ==
X-Forwarded-Encrypted: i=1; AJvYcCWICaXFdT+JiKzWzFS7pc/PFO/Si1KOC5dpB3w7WPCREBHeKxY018uB1puoAfosnpeKT/+ErtNlASBW2A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz554/jzP1y5bOBanxYz6JTw2ScugkgmvoxbhlD2+SKT+cuckFz
	yhKS/yR44B6PE6iyJZ/3lsB/Fo0fIxXSbLAkd6MES9VwYYRKR0FDMrDS
X-Gm-Gg: ATEYQzx5ZvAXRyIfndXGeqHCEp250EAMdpfxQwUZ8ZVcrFwij9JIz6C13bJCz+fLMfi
	FSouM5ZrNUuURSVXswqm+WSi5UUTBHzmIT9k6CDA6P4Tr/jx2iUvVaehbkLRK9vFA3mGVxmM+Uq
	+efPrmozEuBKHZVVffSLKrVdFm8oR6vNJvdgCE8JXWaMHNYi7kjtV4kjyah3k2c3LRuYydHF0Ui
	WybDiWdp2IrCmMixFlk3R8AG/E/DOTV0drIxms4tVG5LJ80e16++mhBD+p2i1M4noUE4LB49Ak8
	ux7V7cw+bCbJRQeHZFTZUM7ZResDyVndfeKh8TF1YDXHiFs0oxtL65AfZRUPWV8qmZKu8esjtj4
	yXnRzJ5VrLD7Q5ry4+ucV8iPs7UJf1b4YI4KdRSoVUYB6qdRJE6Y5cDzRSnwpW0Ie6wTr41qyvx
	wCAurdIcMb+2i+AQqluSL/O+CUuQa3oiGdw8l/
X-Received: by 2002:a05:7022:458d:b0:127:5cda:fb7d with SMTP id a92af1059eb24-1299ba11a49mr4977c88.6.1773762167235;
        Tue, 17 Mar 2026 08:42:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128f639d1e4sm15787042c88.13.2026.03.17.08.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 08:42:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 17 Mar 2026 08:42:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Colin Huang <u8813345@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, Colin.Huang2@amd.com, Carl.Lee@amd.com,
	Peter.Shen@amd.com, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: trivial-devices: Add Delta
 Q54SN120A1 and Q54SW120A7
Message-ID: <4b448eb4-73cc-4d42-84ea-7a0d9a0153d5@roeck-us.net>
References: <20260316-add-q54sn120a1-q54q54sw120a7-v2-0-60e6182cc4a7@gmail.com>
 <20260316-add-q54sn120a1-q54q54sw120a7-v2-1-60e6182cc4a7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316-add-q54sn120a1-q54q54sw120a7-v2-1-60e6182cc4a7@gmail.com>

On Mon, Mar 16, 2026 at 04:39:33PM +0800, Colin Huang wrote:
> Add two additional Delta 1/4-brick DC/DC power modules,
> Q54SN120A1 and Q54SW120A7, to the trivial-devices list.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Colin Huang <u8813345@gmail.com>
> ---

Applied.

Thanks,
Guenter
