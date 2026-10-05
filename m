Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC54C41A77C;
	Mon,  5 Oct 2026 12:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791204056; cv=none; b=pxOeCDrpFgFrQGc47RGi5jyIveQQwnQUAqltZ0T/n6QZzRnPSi0WdTzmUIQ2Dh536ddEBasyDKUfP8vYMFffCU9klePvyFINyFsXJN54SsG6YGyJdta/tVtgY7dwv3sOMP+1O2/FaXTvmIbTSbIuOop4dsxGbhYbWaF+P1VS0rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791204056; c=relaxed/simple;
	bh=9x9gqkZn5gCif3omi2bkJKtC1bEW3xtMqU/9xGC0Ys8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=d1TR2IeqaiFDNqbR+5oix7RG0Ay92kdC3iAJdLejpfY5mZa2cfwMoLV+Lc3zZaeQDVJeeINnWt/ERJbcQpgqaUcmlpE53LncP4oVRAmnz8IGoWbLvJ4Husjol0DDXqbsXODqihqih9E0G2He2Z+uv0CpExbu+TCltYz57wYAOSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dcwu13Wb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dcwu13Wb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B7F71F000FF;
	Mon,  5 Oct 2026 12:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791204054;
	bh=BmUAKoj5qmNLjBdhzGuF62qWxFiIM4dnmkdsHo50ubU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dcwu13WbCyXxiceHzU9Sp4pEKRGo9FUtA2I+j+8t5GUojjI1TL/NAObxIFqzLu9k8
	 VdlcGjR9WCdIAXuqXbN+iHjnCQZyu4rDm/oYYA2RDlsB79VfXozv+VPnBO7X7MYqsq
	 dxyEU9f1RXDFKZuoZk/iXYSy+4DbOxhmQinOuRFVzVqJkM+oDAxFaV5CppoOzByEOO
	 PMZe8yVmX8pCy9011ixed4qZuDzwzvcC7DDd2c/NoHsA0BWGSNOkwYacC0nknpcyj8
	 tsxihnKijW7gtZuUY6wUO5LyjdyyMH1Zn14R6oV6j4I0/hzn2+BDVXDT4XsGymwxPe
	 iKboqqHNGn6AQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 06/12] arm64: dts: qcom: pm7550ba-eliza: Enable BCL
 sensor node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manaf Meethalavalappu Pallikunhi" <manaf.pallikunhi@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-6-50b9a8c730b7@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-6-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 12:40:53 +0000
Message-Id: <20261005124054.3B7F71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] hwmon: qcom-bcl: leaked IRQ wake depth due to cleanup race on unbi=
nd
--

commit 5ea386ff99b613c8ed6f6b198a306fbc43b08172
Author: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

arm64: dts: qcom: pm7550ba-eliza: Enable BCL sensor node
   =20
This commit adds the Battery Current Limiting (BCL) hardware monitor node
for pm7550ba-eliza. The BCL node monitors battery voltage and current,
providing hardware interrupts when configurable thresholds are violated.

> diff --git a/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi b/arch/arm64/bo=
ot/dts/qcom/pm7550ba-eliza.dtsi
> index 18692893ca418..f0c252a386ee8 100644
> --- a/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi
> @@ -50,6 +50,17 @@ pm7550ba_temp_alarm: temp-alarm@a00 {
>  			#thermal-sensor-cells =3D <0>;
>  		};
> =20
> +		sensor@4700 {
> +			compatible =3D "qcom,pm7550ba-bcl";

[Severity: High]
Does enabling this sensor node expose an unbind race in the driver?

In drivers/hwmon/qcom-bcl-hwmon.c:bcl_alarm_irq_init(), the cleanup actions
are registered:

	ret =3D devm_add_action_or_reset(&pdev->dev, bcl_alarm_work_cleanup_action,
				       alarm);
	if (ret)
		return ret;

	if (!enable_irq_wake(irq_num))
		alarm->irq_wake_enabled =3D true;

	ret =3D devm_add_action_or_reset(&pdev->dev, bcl_alarm_wake_cleanup_action,
				       alarm);

If the driver is unbound before an active alarm clears, due to devm LIFO
ordering, bcl_alarm_wake_cleanup_action() executes first. If the IRQ handler
disabled the IRQ wake source and scheduled the poll work,
alarm->irq_wake_enabled is false, so the wake cleanup does nothing.

If the scheduled alarm_poll_work() executes next and sees the alarm cleared,
it successfully re-enables the IRQ wake source and sets
irq_wake_enabled =3D true.

Then bcl_alarm_work_cleanup_action() executes, cancelling the work but
failing to disable the newly re-enabled IRQ wake source. This leaves the
IRQ wake depth permanently unbalanced, preventing the system from entering
system suspend or deep idle states.

Could the actions be registered in a safe order, perhaps by registering the
wake cleanup first so it runs last, or by combining them into a single
ordered teardown action?

> +			reg =3D <0x4700>;
> +			interrupts =3D <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
> +				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
> +				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names =3D "max-min",
> +					  "critical",
> +					  "emergency";
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005-qcom-bcl-h=
wmon-v4-0-50b9a8c730b7@oss.qualcomm.com?part=3D6
