Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37A1287247;
	Wed,  7 Oct 2026 20:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791405763; cv=none; b=LYabSV7RQexsmHx55wj3wXYlFpyO7PLnH46lx+yi+9yRrJzXDKrsny1aDLsYfo/hh8JWadq3t0Ejpb9omjCBoOdZS35L9Fve6lTJDhGKNjbnMENk4LJ2TGZo/6bkQs8wZHGcLMxBMRef2eoUBa8j2s4FtWLuOEJcCCScZJjzESQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791405763; c=relaxed/simple;
	bh=RX+fjINUQ6huh0rjLHVb16n0uIUjjm3B6Rn6jEJ/GS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aZwgA5tDRuxw36o4NK6oJOB7Y9Jtdg642ibwOUwVhreSOm0tz7I0MATXrMN9AHbpMC7MMBK/jzj3qMqmF6mRMAWdXnB0j2+WVdwd81ena2FbXQZ41k85Tf7j0TQEyFlntFcDpZ5n1HY7P20cBYEC8RnM6jzGCdaGyS9mIdAgZkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KvUYiOFs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KvUYiOFs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29FC21F000FF;
	Wed,  7 Oct 2026 20:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791405762;
	bh=T8442lJkY7Lf9rBKc2eNGU5jRTu+8wvBzMXbThdM18s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KvUYiOFs6V/3qqe/oxGL84rADUbCuaih1YjyUE+IpUjGvJ/nbz9ubCNoPyX7IecoG
	 vb/3ROlQNkIoeYLn573aa4tKNJ4fxrKCWLSLFQunRgjJs51MfMf7wZr1sB3Ws/uTpp
	 mAnT3O5ZT78GwQLeVOtyT37gRUnjzPBzkTaTUC/sSDgOAOwxlsW6c9+ZI+61YIBvsB
	 wHVfFSsYWRV6UdKhZIL96LPJcVw/GNBgZM8XsivIQwSc6pnXX+mlgvHLrMM09kfAck
	 opjw7Dc6ZHOEd/4BjWbJsXBg/KEaDLjkS1qti7RmpUiY/HvVtkXOVZ5gV4MGLz3HN5
	 xJRS6PBKSdKXg==
Date: Wed, 7 Oct 2026 15:42:41 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>,
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, mfd@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
	linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	linux-kernel@vger.kernel.org,
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: Re: [PATCH v4 01/12] dt-bindings: hwmon: Describe Qualcomm BCL
 hardware
Message-ID: <179140576107.228529.5861781130037006600.robh@kernel.org>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-1-50b9a8c730b7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-1-50b9a8c730b7@oss.qualcomm.com>


On Mon, 05 Oct 2026 17:54:02 +0530, Manaf Meethalavalappu Pallikunhi wrote:
> Qualcomm SPMI PMIC BCL (Battery Current Limiting) is a safety feature
> that monitors battery or system voltage and current to alert system
> for overcurrent or undervoltage conditions.
> 
> It provides:
> - Real-time voltage and current monitoring
> - Configurable thresholds per channel
> - Hardware interrupts when thresholds are violated
> 
> Add a devicetree binding to describe the BCL on Qualcomm's PMICs.
> 
> Add sensor type to SPMI device list for BCL device.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---
>  .../bindings/hwmon/qcom,pm7250b-bcl.yaml           | 69 ++++++++++++++++++++++
>  .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |  4 ++
>  MAINTAINERS                                        |  7 +++
>  3 files changed, 80 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

