Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E0DFC0A
	for <linux-hwmon@vger.kernel.org>; Thu, 12 Feb 2026 06:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770876337; cv=none; b=gTrvaRnNtztxq7hoTZcB5P81Uw1lxZQ18Xj2nG31lupnqg7Xb5VPOZtvPLHsmopgmry2mWkII7zBy2z2jBqr8RDvEj51KNyay0cmua8zvLJEgWZB752QE/wbJR3k4hT05nUCVQGPtl3oearkqWnc/lcF+ji1y9pVIw2Eyv6w7Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770876337; c=relaxed/simple;
	bh=hJ1XiKeV+eGXGwheJNuVarB7yutfioIH6uuZnrODlcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VvaPZiEr4dWAunpdBCjH29xCzX3DTHjrxEkGiQ7jxkrbmdne3I4Y2X4IozSOUmiUu3svNftPVsj5H5Yjd1WWuxd3t42h/a9PXfAcSjDFB7EuZqk52W4Vwj5CrDZtdAPPUfU64GlPM2jhleyRB2TGNztaq+nsBGvGU6P2S2c9Qis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WjNrgc7x; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WjNrgc7x"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1233bc1117fso1007744c88.0
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Feb 2026 22:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770876335; x=1771481135; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SOtrtrMQoZ6MahIrCpum9bHHr7x5qg9RpXaMKNNmIFY=;
        b=WjNrgc7xSwgK2mf6UyhIKHGSYlaTpxXvDoj8OpAm3wOfx3HY9W7p7wdosz1BJFJf88
         ECQ97cHdbcRHOcY/nxKWiomrV+G5rQeUxOqbkqBXDcY/M646pwqAVxY3JwhW66TfOh5I
         iA5GJMNm6GstJNXxqFMeiH+llHvtqXlE1zpATMFBp13fXerC9HoCwk0FdyecgL4qsYtY
         GZZ0hFhxUIzTUjxAWk9MkA0/jkeSXxkK9XsKFnXuV1UILhEhi9SxqxzHor6LbbIha9WE
         zDZ3Eq6VlejRWxupMddPfYu96df8ETW4nYd+WDzeEH2NufxV9VMd0v1au1P2hOQztu25
         NAPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770876335; x=1771481135;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SOtrtrMQoZ6MahIrCpum9bHHr7x5qg9RpXaMKNNmIFY=;
        b=rEqHx4jJid099Znnnciw93rbY47Z5KdYEeQ/9foiHl2T4jTbUGErig5s6ws0ZhZSZE
         mTiix6WXQCAQ3NNXYqL6wpzxXJl8YoG0GNmYB9Aym8aIDTDlwAnZaBMWeiXxbZd6IEL+
         2teN9sGpYOWoLVGSWdO0pRk3kIsyybF+ZtlOaViZWU9W9EMhZc9zUjXNRs1GGdpCbSLc
         hUF/zHFti1uNyGERlDzB7vsu1qDtWSXDekzfEiqR/FPA4XBYKZ9N0g6jdE0qHz8AonFL
         9U9dq5J89IQ+tpiTkqc2VQf7vBZNKI1iT9qjDBhXmqGHdalhWPPJa1A5Lgpcuq8+L1Hr
         jp4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXFCTRtK1elUJiDZqhRnAZSEpDsQH0YDvNSv9fnZq+pJO8Up02iWHksqDgw3urp7AAkAEIE3U9oY6Gchw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpv4smaQP+OuOBsDOFbVZ+aq+vWCw0XbY3EAE5AvfcfcyOVoxd
	MllLcCeB/Tng/V0a/ULz4E6vx0xrZ9oD8Qwg315g5S1IKXf8oOAcUKky
X-Gm-Gg: AZuq6aKV6m4Tf9sq3+lTsQzeEHGvdnpGGDm43I8pKzQdaZhnqb6YVrKTCZUnKVNAprz
	EdJNI07r1W9/BuLwXm+JeXDYWbC0Ffo1E1T65KQ5XiihEN+WuRC56DYynd0dcqYBCBIKMr26Y50
	+BoB467SY0qX7koeNLh0WZ4/JZuMVWGdeg4f/v/vhzql7jrurJEYwakVZbXRMdNYHsunehFAJV6
	gDLgabIA8WA79oJQH5x9RYpcl+2hjkMCQd+5lMf9StHhJOUGSJN896jSBwVaUlqi7S94ZoyLG6h
	3m8Lh6LZ9r5teaFpz0mvKyPcm0Kups+PxsoIIs+BCQghkn8HT8MKNCEEsPNJbqTwlKjoTERI+FJ
	irdoyalShIIrfqhKcE8uVp6xC3nJTLbduIP9amQA/IWnBge6e7XTEZ3H50TnnzhsEfZHBZ54pkJ
	3vpP+qCVlBau+E5B0zVY1VXKrufdMl+REA0U9c
X-Received: by 2002:a05:7300:fb8d:b0:2b8:27ec:b2b9 with SMTP id 5a478bee46e88-2baab77edaamr770138eec.20.1770876334822;
        Wed, 11 Feb 2026 22:05:34 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ba9dd0a04csm2819156eec.33.2026.02.11.22.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 22:05:33 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 11 Feb 2026 22:05:32 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Huan He <hehuan1@eswincomputing.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com,
	luyulin@eswincomputing.com
Subject: Re: Re: [PATCH v2 0/2] Add driver support for ESWIN EIC7700 PVT
 controller
Message-ID: <0183a68b-f8e9-48b8-b77f-5ae0a048a2bf@roeck-us.net>
References: <20260128101400.859-1-hehuan1@eswincomputing.com>
 <1a08e50a.362b.19c4c20db59.Coremail.hehuan1@eswincomputing.com>
 <e648565e-59a9-4270-bbbd-7c53f5f65c6c@kernel.org>
 <2c43c2a.366b.19c5017e58a.Coremail.hehuan1@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c43c2a.366b.19c5017e58a.Coremail.hehuan1@eswincomputing.com>

On Thu, Feb 12, 2026 at 12:24:29PM +0800, Huan He wrote:
> > > Hi Krzysztof, Guenter, all,
> > > 
> > > The v1 patch received reviews and comments from Krzysztof and Guenter.
> > > The v2 patch incorporates changes based on those comments and has received
> > > feedback from Conor.
> > > 
> > > I'm not sure if there has been time to review the updated v2 yet. Should I
> > > wait for further feedback, or is any action needed from my side?
> > 
> > 
> > Huh? You received review on v2 thus such ping suggests that you don't
> > consider that given review as an important one. That would be very sad
> > impression to make...
> > 
> 
> Hi Krzysztof, Guenter, Conor,
> 
> Sorry for the confusion - I did not mean to disregard the review.
> 
> In v1, I received comments on both the YAML binding and the driver code
> from you and Guenter, and updated both parts in v2 accordingly.
> 
> For v2, Conor provided further feedback on the binding part, which I will
> address in v3.
> 
> My question was mainly about the driver changes in v2. I have not received
> further comments on that part since posting v2, so I just wanted to check
> whether there are any remaining concerns regarding the driver code.
> 

See below.

Guenter

---
# Task
Date: 2026-02-11 21:54:07
Model: gemini-3-pro-preview
Prompts SHA: HEAD
Commits to review:
- 2b148b14e234 ("dt-bindings: hwmon: Add Eswin EIC7700 PVT sensor")
- 6f4d5698f334 ("hwmon: Add Eswin EIC7700 PVT sensor driver")


# Commit 2b148b14e234 ("dt-bindings: hwmon: Add Eswin EIC7700 PVT sensor")
Ref: 2b148b14e2344fc9403c02cc27ff0bec77d1568c

# Analysis of commit 2b148b14e2344fc9403c02cc27ff0bec77d1568c

## Context
This commit adds a new DeviceTree binding documentation for the Eswin EIC7700 PVT sensor. The binding is located at `Documentation/devicetree/bindings/hwmon/eswin,eic7700-pvt.yaml`.

## Changes
- Adds `Documentation/devicetree/bindings/hwmon/eswin,eic7700-pvt.yaml`

## Analysis
The new binding file was checked against standard DeviceTree binding conventions and the `hwmon` subsystem requirements.

### Correctness Checks
- **Schema Validation**: The YAML syntax is valid. `$id` and `$schema` are correct.
- **Properties**:
    - `compatible`: `eswin,eic7700-pvt` uses a documented vendor prefix (`eswin`).
    - `reg`, `clocks`, `resets`, `interrupts`: All defined with `maxItems: 1` or standard constraints.
    - `label`: Defined as a required property to distinguish between two instances (SoC vs DDR). This aligns with `hwmon-common.yaml` and is justified by the hardware description.
    - `#thermal-sensor-cells`: Defined as `const: 0`, appropriate for a sensor provider.
- **Example**: The example node `pvt@50b00000` is syntactically correct and matches the schema. The node name `pvt` is consistent with other similar bindings (e.g., `baikal,bt1-pvt.yaml`).
- **Maintainers**: Listed maintainers match the Signed-off-by lines in the commit.

### Regressions
No regressions were found. The binding file is self-contained and follows established patterns.

## False Positives Eliminated
- **Required `label` property**: Initially flagged as potentially non-standard for a required property, but verification with `hwmon-common.yaml` and the specific need to distinguish identical hardware blocks for different domains (SoC vs DDR) confirmed it is valid usage.
- **Node name `pvt`**: Verified against `baikal,bt1-pvt.yaml` to confirm `pvt` is an accepted generic node name for PVT sensors.

FINAL REGRESSIONS FOUND: 0

# Commit 6f4d5698f334 ("hwmon: Add Eswin EIC7700 PVT sensor driver")
1.  eic7700-pvt.c:487: ERROR: Unbalanced clock refcount with Runtime PM
    > +	pvt->clk = devm_clk_get_enabled(&pdev->dev, NULL);

    Using `devm_clk_get_enabled()` enables the clock and registers a devm action
    to disable it on removal. However, the driver also uses Runtime PM to manage
    the same clock:

    > +static int __maybe_unused eic7700_pvt_runtime_suspend(struct device *dev)
    > +{
    > +	struct pvt_hwmon *pvt = dev_get_drvdata(dev);
    > +
    > +	clk_disable_unprepare(pvt->clk);

    If the device is runtime suspended when `remove()` is called:
    1. `probe()`: `clk_prepare_enable()` (Ref: 1)
    2. `runtime_suspend()`: `clk_disable_unprepare()` (Ref: 0)
    3. `remove()` (via devm): `clk_disable_unprepare()` (Ref: -1)

    This leads to a refcount underflow and warning.

    Fix: Use `devm_clk_get()` and manually call `clk_prepare_enable()` in probe.
    Ensure that the manual enable is balanced correctly, or rely on Runtime PM
    (and `pm_runtime_get_sync` in probe) to handle the clock, ensuring
    `pm_runtime_put` balances it. Since `check_pwr` needs the clock before
    Runtime PM is enabled, you should enable it manually and then possibly
    disable it before enabling Runtime PM, or keep it enabled and let Runtime PM
    take over (but ensure `remove` doesn't double disable).

    A common pattern:
    ```c
    pvt->clk = devm_clk_get(dev, NULL);
    ...
    clk_prepare_enable(pvt->clk);
    ...
    pm_runtime_enable(dev);
    pm_runtime_get_noresume(dev);
    ...
    pm_runtime_put(dev);
    ```
    And ensure `remove` (or devm action) disables it ONLY if not suspended?
    Actually, simpler is:
    Don't use `devm_clk_get_enabled` if you use `runtime_suspend` to disable it.
    Use `devm_clk_get`.
    In probe: `clk_prepare_enable`.
    Register a `devm_add_action` that calls `clk_disable_unprepare` *only if* the
    driver is not using Runtime PM to control it? No, that's messy.

    Better fix:
    Use `devm_clk_get`.
    In probe: `clk_prepare_enable`.
    In remove (devm action?): `clk_disable_unprepare` (but this still has the issue).

    Correct Fix:
    Do not use `clk_disable_unprepare` in `runtime_suspend` if you used
    `devm_clk_get_enabled`.
    OR
    Don't use `devm_clk_get_enabled`. Use `devm_clk_get`.
    Manage the clock entirely via Runtime PM.
    In probe:
    `clk_prepare_enable(pvt->clk);` (Temporary for check_pwr)
    `check_pwr...`
    `clk_disable_unprepare(pvt->clk);`
    `pm_runtime_enable(dev);`
    ...

2.  eic7700-pvt.c:154: ERROR: Swallowing signal interruption
    > +	if (ret && (ret != -ERESTARTSYS))
    > +		return ret;

    If `wait_for_completion_interruptible()` returns `-ERESTARTSYS` (which is
    non-zero), the condition `(ret != -ERESTARTSYS)` is false, so the if-statement
    is skipped. The function then proceeds to return 0 (success) with potentially
    uninitialized/stale data.

    Fix:
    ```c
    if (ret)
        return ret;
    ```

3.  eic7700-pvt.c:368: WARN: Spurious interrupts on shared IRQ line
    > +	eic7700_pvt_update(pvt->regs + PVT_ENA, PVT_ENA_EN, PVT_ENA_EN);

    `check_pwr` enables the device (and thus potential interrupts) before
    `request_irq` is called. If the IRQ line is shared and the device asserts
    an interrupt immediately, the interrupt will be unhandled (spurious) because
    no handler is registered yet.

    Fix: Request the IRQ before enabling the device, or ensure interrupts are masked
    at the controller level (if possible) before enabling the block. Since `check_pwr`
    relies on polling and ISR clears the status, moving `request_irq` is tricky.
    Verify if `PVT_ENA` has a separate interrupt enable bit or if `PVT_INT` has a mask.
    If not, this is a hardware/driver design risk.

4.  eic7700-pvt.c:147: NOTE: Infinite wait possibility
    > +	ret = wait_for_completion_interruptible(&pvt->conversion);

    If the hardware fails to generate an interrupt (e.g., hangs), this will wait
    indefinitely (unless a signal is sent). It is generally safer to use
    `wait_for_completion_timeout` in hardware drivers.

# Summary

| Commit                                                            | Regressions |
| :---------------------------------------------------------------- | :---------- |
| 2b148b14e234 ("dt-bindings: hwmon: Add Eswin EIC7700 PVT sensor") | 0           |
| 6f4d5698f334 ("hwmon: Add Eswin EIC7700 PVT sensor driver")       | 4           |
