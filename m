Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C65D35B62C;
	Mon, 23 Feb 2026 10:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771842732; cv=none; b=uV5V4Z3CfsPNIS5rhoOH+lwJ5fxyp4xPgVSrDce1AMFW3mPxsB7WuU+5Jfr/BDWT+NgCiSiELdsfM0wWbxoH0RG4JrfrYNcrBexp5TWMGWn/DndKxV31kMjRq9mAJqw2DLeiTLNExI1rgDEuD51XBw2zaPBEco3dbD3nXdJM/qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771842732; c=relaxed/simple;
	bh=NPLT8X6ipQ/GeUoSR0YAw9+n5uaaiwOMYlEmKyXO5Mo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cQkvYjlVTspkRBCRZq/ZZZ7Jn7kXZK0GoGJfdiQULStHkyWOi/UusUpMjfqyyxns8l6Lbu1yypTJbrpT272grnAL9ILc14tpKHZcI5xv2Ug52EaJwr34VPdMSsW+vwDI/+1KKCYT3+FG1mF4v5iiv0/eUG0T19UjsmK+LkkkuUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gTJx90G2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gTJx90G2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1983AC116C6;
	Mon, 23 Feb 2026 10:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771842731;
	bh=NPLT8X6ipQ/GeUoSR0YAw9+n5uaaiwOMYlEmKyXO5Mo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gTJx90G2/P3/Sxi6344IOBh+yZoDt/T5C5BgtsRjn0RNaz1YbuHlWf7fyi4RhsmXb
	 Lz6VwwK1tBUnTMP5UMt0dKxy/m29+etmLfBtoWnl5aGqkY2OslIOIF3GzOhHOqrm1K
	 aVk25Id/0lcz1y0qTK/D7VFZpsDhaMoXRljxbQRgshUM8Jw9AxgD9ZaMEVd85aW5dT
	 /jaD0fdrW9k3yUXx1i7+JyTKDBt/Zjil5D3B6dZdwIP4VX8uU0KdGF0iQ8EV3mvzam
	 lCIQH37bNlnGHF62taIEv+m2XFsgyRfTc+KROIPPdPZq68CYla8Wu3SJfxDC0lJ15B
	 UXGssyJh88y2Q==
Date: Mon, 23 Feb 2026 11:32:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hao Yu <haoyufine@gmail.com>
Cc: linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, jcdra1@gmail.com, akhilesh@ee.iitb.ac.in, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: hwmon: add aosong,aht10 family
Message-ID: <20260223-sincere-agouti-of-resistance-eef518@quoll>
References: <20260222170332.1616-1-haoyufine@gmail.com>
 <20260222170332.1616-2-haoyufine@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260222170332.1616-2-haoyufine@gmail.com>

On Mon, Feb 23, 2026 at 01:03:30AM +0800, Hao Yu wrote:
> Add device tree bindings for Aosong AHT10, AHT20 and DHT20 sensors.
> 
> Signed-off-by: Hao Yu <haoyufine@gmail.com>
> ---
>  .../bindings/hwmon/aosong,aht10.yaml          | 41 +++++++++++++++++++

This should go to trivial-devices schema.

Best regards,
Krzysztof

