Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E9238E5FE;
	Sun,  8 Mar 2026 17:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772989758; cv=none; b=JeITp9I/A74YnZZKfZe+whZEVqXVbtivBKiGrlqAjj8EN0qEk9ouRSD1u6ny/rqFd55AqoQX/VTEC9PuQRRRu1xhkFdoq6e9yEPF27vpafxgTiQC3ZJWMeLDYpA3d/nJ+7fyu5WNaXWvbIATapOvILHXQq/0WUsQ9nnfjalSUtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772989758; c=relaxed/simple;
	bh=fYAwFnYbTqXMySr4ooZVkVt5HYSTH5OncHeDP+vD8Ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YZFJBU+hbNTeUxcKS/U4fW6S6XzKTdMCBWu2iXdENftUUXfE+IugnOKfZUImVYGc6h7GV6mLHKRsExoS7+1mpxUF/sh3aIigFB3yIie893q/RSYcemodH1srCVljBkpXLPhLdESIApS07l4RkrcMNhwY0hcGN1g1QiOqbksuHAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vD5RyWKv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vD5RyWKv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46D52C116C6;
	Sun,  8 Mar 2026 17:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772989757;
	bh=fYAwFnYbTqXMySr4ooZVkVt5HYSTH5OncHeDP+vD8Ho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vD5RyWKvYAURCKReKXUuO/oOv+Z0qII/26bjFgtKQT4t9tzbSMHC55EN+H5SwZOzS
	 2wA2Y3mQJ/IvbcA2yxrv8CJYW2OH+mfgPtXxvfD2b/OsddhOS81jTgr5snBOqks1sp
	 qBZ8OKcpbd6GlKJJQjeQFi52SbPvF4qy3/8gz0HP1Ob29r0I/KBM+kaGcZiQh7TVs8
	 JgisiZHCNolIlt9MgzfrhhiYZw5cIFqkbnEdiRPTkxPYydjJEN6qYT7/vtGg/9+1IZ
	 q86FuvuTOj5Jyyud1cQ68g2HQn24n3IFIveG30vAD3szSBQVhlkAJhkUyMs0xwXt8v
	 Uhc9/HeTn26Tw==
Date: Sun, 8 Mar 2026 10:09:15 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rahul Tanwar <rtanwar@maxlinear.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH v2 2/2] riscv: dts: thead: th1520: add coefficients to
 the PVT node
Message-ID: <aa2tO5OQ0kk3Mubn@x1>
References: <20260305144044.44208-1-zhengxingda@iscas.ac.cn>
 <20260305144044.44208-3-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305144044.44208-3-zhengxingda@iscas.ac.cn>

On Thu, Mar 05, 2026 at 10:40:44PM +0800, Icenowy Zheng wrote:
> The manual of TH1520 contains a set of coefficients a little different
> to the driver default ones.
> 
> Add them to the device tree node of PVT.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
> No changes in v2.
> 
>  arch/riscv/boot/dts/thead/th1520.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index bd5d33840884e..2160c8b6c2261 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -753,6 +753,10 @@ pvt: pvt@fffff4e000 {
>  			reg-names = "common", "ts", "pd", "vm";
>  			clocks = <&aonsys_clk>;
>  			#thermal-sensor-cells = <1>;
> +			moortec,ts-coeff-g = <42740>;
> +			moortec,ts-coeff-h = <220500>;
> +			moortec,ts-coeff-j = <(-160)>;
> +			moortec,ts-coeff-cal5 = <4094>;
>  		};
>  
>  		gpio@fffff52000 {
> -- 
> 2.52.0
> 

Thanks for the patch. This matches the information in "Section 15.3.4
Temperature Sensor" on page 866 in the TH1520 System User Manul.

Reviewed-by: Drew Fustini <fustini@kernel.org>
