Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3248206040;
	Wed, 13 Nov 2024 20:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731528475; cv=none; b=Xq0R17ciYJOpmrAMyhU+Gh5Vsfwb039hq6ZhEpApeChwlae8bUr56uAMsUdpRFB8t8tKhK6Z6vrLbnwEZuxxYDfPlAHkBVOgv1AX4RirsWzhu7KUXC8F2/B9MEqqKVbr0uTrpwFiZZPcBRf/rM/d51Kyy1oEGHWEoDzLsNN6bj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731528475; c=relaxed/simple;
	bh=W2wLfm9TAFNqf6cHkoLkrjTWBslIgZ7B9w9GL8icBFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nv+9sdG7vAzwZ4UQfubYHK7EpQRlyAFJX8Wfgh0Rx7Isqeo3YTyLuBvGrtIBNQkeIhU0Y1gEBmS8CJNU49Pr5eR0RRSVcmIWgR37sAYuV7+SRuid7ArQy7AfadTRuaPwrFpeVRvZSV5EruDyTk/yjinrlii3+annUovNjPm65Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WpyheLxO; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WpyheLxO"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2e5a0177531so5813934a91.2;
        Wed, 13 Nov 2024 12:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731528473; x=1732133273; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y4j1vJGFRxVrpDPuAyXQWtm8jyY2k87uymDRiXPcMJE=;
        b=WpyheLxOGoQPXzmU0e7eziLizE1Yu/Q5h3eNSLT93B8Y3FK1Oy7cWmMpqREfYC0q5i
         2sVcaw2urNwaGD7+1I6GNOzJ9jY03C8CwFTUh07HpEjy6i3Y0s/nE+6v0NFH0PNCpnLV
         RgSRJk3cIWoI0goMBnkOCV77Padde//AfswjmE+YaHqgUjLA+DWUcAC2eDfN783Skc+B
         a6Is/WGZPuCpgW7IRUBspYx71zqQhdkMhv2EOlgkcCjnrw8VmjZGKji1XOqPKEy/rzQt
         swJL04OsqmVLpVaIm7agxLznFp67jxqn9Spfj0t1SQKJxlhVxz2u8lW7jnk0218Ne23M
         VqOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731528473; x=1732133273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y4j1vJGFRxVrpDPuAyXQWtm8jyY2k87uymDRiXPcMJE=;
        b=e7zf+TlhMRkgGg3H+ZWO+SIMAsYFReT3zmN7LYvF1xmRZrdw3DF6OveZo/1n8QTE3k
         y83hZwToxEVhvEgBCW+2KflVWFnSF4FLsu/utW6JGT6/9f6MqA/ZeUWoeYMg/2lyEvNJ
         rzj3OUBnJvyBYMuBgyQ0dW+lrcq8r5CrFoTsDVzXa6RCFFD5rbkbSJlrC46jDOtfxo8d
         QspnNL5FIptXrCumTZewvQ+wU1s5Wp83hbWhqDKfPAqgPtF1t9RLEI9S0IWEPjpe9i2l
         xxwimrJJ8YAZ2Uy2ibJKMCRZjIyavbja3nQN9yNNyE6Z9Dpl52xpTRmotL/hAa0Jaa/r
         5m6g==
X-Forwarded-Encrypted: i=1; AJvYcCVIHEdybrwAYxFxo8y4IaODOfok3Qj5CpuaBsOzsM2GBvaMiiYRyY4nSPX/eOPVzdYgFWBfQsvE6SNjVDc=@vger.kernel.org, AJvYcCWUXQeF+zOkVDAU8ebQAPVq5FAVzmCuUXxVPBX8auGQoYAnbDMWPybnxheXZpe05+m/iBV0T10mZ1gH@vger.kernel.org, AJvYcCWs1hoGwttatner82GooI0++tZSjWeH3KgTgFD7bJa8B4kuUXmH2NxDKXDFTWy8/Bd9emFKRB8Qstcs@vger.kernel.org
X-Gm-Message-State: AOJu0YxGX6IZHV4DLS+tnb0UcldfoR9E1hnobNjB9/SQbBBqxcyoMK29
	xNYlN+u1L7V3CfExaK2ah5y9HxngxMERKnCBLvwlVBL8b7jUkh4Q
X-Google-Smtp-Source: AGHT+IHztoxmba7AYF4jfx70m7aN3IyXMskiky85+dy1DFP1JIKL4oEy4WkNQfoCK1+rHATeDQkn0g==
X-Received: by 2002:a17:90b:1f81:b0:2e2:d821:1b77 with SMTP id 98e67ed59e1d1-2e9b1780c38mr27849736a91.24.1731528473255;
        Wed, 13 Nov 2024 12:07:53 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ea00464f00sm17129a91.18.2024.11.13.12.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 12:07:52 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 13 Nov 2024 12:07:51 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Grant Peltier <grantpeltier93@gmail.com>
Cc: robh@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
	grant.peltier.jg@renesas.com, brandon.howell.jg@renesas.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 2/2] dt-bindings: hwmon: isl68137: add bindings to
 support voltage dividers
Message-ID: <6c546fdb-4511-4942-9171-287687bca32d@roeck-us.net>
References: <cover.1731439797.git.grantpeltier93@gmail.com>
 <f7ac200e982961ff733de27a5c4505c04d68b6f3.1731439797.git.grantpeltier93@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7ac200e982961ff733de27a5c4505c04d68b6f3.1731439797.git.grantpeltier93@gmail.com>

On Tue, Nov 12, 2024 at 02:10:06PM -0600, Grant Peltier wrote:
> Add devicetree bindings to support declaring optional voltage dividers to
> the rail outputs of supported digital multiphase regulators. Some
> applications require Vout to exceed the voltage range that the Vsense pin
> can detect. This binding definition allows users to define the
> characteristics of a voltage divider placed between Vout and the Vsense
> pin for any rail powered by the device.
> 
> These bindings copy the vout-voltage-divider property defined in the
> maxim,max20730 bindings schema since it is the best fit for the use case
> of scaling hwmon PMBus telemetry. The generic voltage-divider property
> used by many iio drivers was determined to be a poor fit because that
> schema is tied directly to iio for the purpose of scaling io-channel
> voltages and the isl68137 driver is not an iio driver.
> 
> New schema file named isil,isl68137.yaml to align with the corresponding
> driver name and pre-existing bindings ported from trivial bindings.
> However, all new device bindings use renesas as the vendor prefix
> since Renesas acquired Intersil and now maintains all documentation
> for the devices.
> 
> Signed-off-by: Grant Peltier <grantpeltier93@gmail.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Applied.

Thanks,
Guenter
