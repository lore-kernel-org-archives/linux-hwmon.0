Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABEC38F9C;
	Sat, 14 Mar 2026 16:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773507465; cv=none; b=TLMIcXwe4LbKGNISg/Frd3kHf3J2/GCGuLad0N49NRm21VNXLXVkxsWGyCVkHaV82rB6rvQ1WneIx6ia6Z+gpLXvs+yqHbQ8d5TgWzhoVEBCtGfdMokSGshSTcFAUJ0DmM4AB+U9u0EfctgEIZr3xRmTKBsJi88a8EtniGuXZV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773507465; c=relaxed/simple;
	bh=1QgLBpuzpumxuzLwiduaG7BRUXzEsWH9tCQ1NLudE8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WEEWB/nrsYNjZkXeXrRwZFyllVFhcuaES3NKHhtcaH5YEze2IHwLBBRK8LlDi8qlJ8NlME8HCauET9aHLZBXkkYT72fyievIIhK1S4K3zyiRjfSUG91zMY8g7z1jZqqc/jNQPPHxI+Pl70U93mUpN1OxrshRHeXm3cx+QBbOW30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mBhpxFbx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mBhpxFbx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3899C116C6;
	Sat, 14 Mar 2026 16:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773507465;
	bh=1QgLBpuzpumxuzLwiduaG7BRUXzEsWH9tCQ1NLudE8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mBhpxFbxjovN1pMXc5+sqAYNmShCKqCCyPvMkI4tqtFmDWvmRzovEEjhSdRZgoXil
	 aBGufqNe/a3q1NYbm5dXhoNVZUPPYOAdzbKgl6N9nPoGnW4jLiwG1MgN3R/64fB8QS
	 MW78SLQJuOBnmRbmwG4nA/vQ/dVrt0jQZa9OJdrzeCzlTxBeY94JHCzSYD5OewNUQn
	 Jwi2f02iERKsUAVQSO6x63WD6GrZ5LqigbS5nAE4cYfuaO7/tDumj/HnmtAo4JKSft
	 8jwlKJGCTrbNPfZIH0/09yDkb/AUSZA6H57GBrEiiXDk8SQA0bGyEleaoqglERplrC
	 SL2cyuxjpuGIw==
Date: Sat, 14 Mar 2026 09:57:43 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rahul Tanwar <rtanwar@maxlinear.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>, Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH v3 2/2] riscv: dts: thead: th1520: add coefficients to
 the PVT node
Message-ID: <abWTh/HkVAiIjInt@x1>
References: <20260309162457.4128205-1-zhengxingda@iscas.ac.cn>
 <20260309162457.4128205-3-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309162457.4128205-3-zhengxingda@iscas.ac.cn>

On Tue, Mar 10, 2026 at 12:24:57AM +0800, Icenowy Zheng wrote:
> The manual of TH1520 contains a set of coefficients a little different
> to the driver default ones.
> 
> Add them to the device tree node of PVT.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> Reviewed-by: Drew Fustini <fustini@kernel.org>
> ---
> Changes in v3:
> - Added Drew's R-b.
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

I have applied this to thead-dt-for-next:

https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/commit/?h=thead-dt-for-next&id=2592a7072a816be80337b0a85e6279f75498262b

Thanks,
Drew
