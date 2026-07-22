Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75C0471268;
	Wed, 22 Jul 2026 07:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784706094; cv=none; b=pF+AzQgigLhMM7uiDNvkdTVBv9cQ+RntJHx+Cr4fOZzN45nE1Mb9HsXv8nywrk5F3Wz5SvfFPmicHHkFWz0qfGqseuBIs6mhMUqPWdUIHl9xuvsnajfmAUgqcaSzgPWvXXWOFnSXudcsXcGRvoQl38TC1dz2oSKy6/2Hd0QcosU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784706094; c=relaxed/simple;
	bh=BvvRKmxKycl+3sMCau1lIJTYhbKVLgoO0gBIZx1xdPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QvYTPYBQC3fmtPYso5uFwFlqXjaeikmxgTCyGCuFMXWLxGK2Gqy325EOuZXWxG1Fy8z07vP2wcwqjJkBcrEX0DFi7uSt50DX3iVVZOY9uDnBA89Qvcscr6WCgoNMQucTyyYUTWG/z1R+geHu9nqpaFfilvUHyb1CD3X3QzpWAHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jv8tYQax; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jv8tYQax"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 067711F000E9;
	Wed, 22 Jul 2026 07:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784706093;
	bh=sp/SGJFqKQzCbpo3NzPatfiA/2iBXboNQlGAF1b3xDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Jv8tYQaxPAF5+BVpYsA6tGqNNkF5NakW0XsmYITqrGBdVF3ZFGvpJfx8GqefHB+Ez
	 nyKcjhqSRIBiXuwYA5v1W11ZSJ7cR79Kg29x/2Gncw6vQ4XnL3qH13c3Xx3aDJqPjp
	 WaGU++br9h9XRdl0kqeiY2Whl5wVuAmescPjIpmyYU69Tc1FpLXvZjKSbxo2gcbBuP
	 LwhJsSkMRW//UdJAe1Db1wenagF/UV4oQAil5NXJ2Io9uD8dc/ijpypNj7h/1lPY7i
	 35kHnZQqaErvWbGPGRJtz9DGpQpOpS/9JqLCjg2AyKtvIgRAnk+h+/PvjeSM61BPb2
	 qqmmZgiSJugyw==
Date: Wed, 22 Jul 2026 09:41:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andy Chung <Andy.Chung@amd.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: hwmon: Add Kandou KB9002
Message-ID: <20260722-efficient-mussel-of-enthusiasm-1df91c@quoll>
References: <20260721-kb9002-upstream-v3-0-70563922be8d@amd.com>
 <20260721-kb9002-upstream-v3-2-70563922be8d@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260721-kb9002-upstream-v3-2-70563922be8d@amd.com>

On Tue, Jul 21, 2026 at 02:31:33PM +0800, Andy Chung wrote:
> Add device tree bindings for the Kandou KB9002 PCIe 5.0 retimer, an
> SMBus target that exposes an aggregated die temperature.
> 
> Signed-off-by: Andy Chung <Andy.Chung@amd.com>
> ---
>  .../devicetree/bindings/hwmon/kandou,kb9002.yaml   | 46 ++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>

So a trivial device and can go to trivial-devices? What is incomplete
here, what is missing?

Best regards,
Krzysztof

