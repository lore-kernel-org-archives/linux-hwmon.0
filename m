Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513F82C08BC;
	Thu, 18 Dec 2025 08:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766046736; cv=none; b=shYd8f0SMBipLLjJmhQDSkzMra4jJ90SAYgb0cLYbzZ/rfsX6SK2t/hXO0D7rnjFj+TmSNe/pttmE/jtaoGkcUmHfa7YSegCtqapiQw4l0iob/Rw2mBA1HLwzq6E/AlDxoapIlS5QbLgqN3f9uoQ6nsKUrHTphGXWSbJA67qjoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766046736; c=relaxed/simple;
	bh=RQXhyuYSFlv4WMvgK9ePMV0v2MlB2P2VrLQCgozoKvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eQQplG8UOTByHunwAS+eDkz2RHX/36gd/bRESx3j6QJKKB2fNaVILGj1at2Ztvic4fTz4ZU8/MVEruDI/T78CpHRX3PztePedWGqJPdERh/yWRZQOLeIgDbMipmJ1wjQckzwpdhfF2+vfKlINrVYndoLrx5ONoGB68j9Whl484Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E8LAWJzv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E8LAWJzv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AED2C4CEFB;
	Thu, 18 Dec 2025 08:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766046735;
	bh=RQXhyuYSFlv4WMvgK9ePMV0v2MlB2P2VrLQCgozoKvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E8LAWJzvXOQS16MP74vm1tmhSivbWIyOi7yRZZDtxQ9GanGU2IzUovC6KnRTywDt8
	 uRDk5XJPvjjbv2RjAfvgcST5zFh7s1CFmeUVIfVgg7CWgequBA1Ufh6eMwrslPK/Xm
	 afXRVEX7q+22LwVlkywBSjRltPC4+R6pdlvRwAXZqUtXMa5dlli9wY3y0JYvKd70Bw
	 hSd9QcdrQndlaEi/bvq5xkILWk4zuA1PEZs1nCyNPMLbuQ9EroOzZjp/ptSUynFZAn
	 WVzCzVJ0xIXJFyMhB9KChcvpSB8ejBP2hYPECdIi6NAtZliH2oDfyMVs/tAocjiJ8c
	 thL2qBzyka+3A==
Date: Thu, 18 Dec 2025 09:32:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Charles Hsu <hsu.yungteng@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: add STEF48H28
Message-ID: <20251218-powerful-swinging-orangutan-2ce3e9@quoll>
References: <20251216083712.260140-1-hsu.yungteng@gmail.com>
 <20251217013544.363715-1-hsu.yungteng@gmail.com>
 <20251217013544.363715-2-hsu.yungteng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251217013544.363715-2-hsu.yungteng@gmail.com>

On Wed, Dec 17, 2025 at 09:35:43AM +0800, Charles Hsu wrote:
> Add device tree bindings for the STEF48H28.

Which is what exactly? Why is this a trivial device? You have entire
commit msg for this purpose but instead you repeated what the diff is
doing, which is pretty obvious.

> 
> Signed-off-by: Charles Hsu <hsu.yungteng@gmail.com>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Do not attach (thread) your patchsets to some other threads (unrelated
or older versions). This buries them deep in the mailbox and might
interfere with applying entire sets. See also:
https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/submitting-patches.rst#L830

Best regards,
Krzysztof

