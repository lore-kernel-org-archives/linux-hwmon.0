Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB2043B3F8
	for <linux-hwmon@vger.kernel.org>; Tue, 11 Aug 2026 23:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786492268; cv=none; b=cj+MR8V2nVwZeby32Y88z2m/6i0K+ONTrBa3Crv0uhA8BUm9GpSF3h2HKqk8Z0c+gz3i+DOb2nXBQj6PVIkEYJ2BkEAm4WcrqTvBkhQRBz8gEtELl2e8XKhpns5Jv+o0qx/wfgMWuKzBJ+BnvXj/5fSUpwcKS6G5P0NuEgqTUlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786492268; c=relaxed/simple;
	bh=7HW9pMMVGw3dslD/MrP8zid6l2bhIohBrtY9ilwQaEk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tu5Hb/MEgSwK3ZW6mFZyKzlVQVg5MKDjcHSXYso5LG+DDtEE4w8s9nb2a1VHCLmHv8tfr6aTTp3SSeYhUU67RpB0JrAiPsojKGig0LP7gnc1TBCY6RmCFzfPL9902RPW2fG5HuTnGIjkF1pQltz5Rqh+QzOqs/Pk1MUSEnSn6pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CL19sA2j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CL19sA2j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76F7C1F00A3A;
	Tue, 11 Aug 2026 23:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786492266;
	bh=KITD9rZ91ZKr9Nw1tqnXSqcQtqsVWLtnP94FdQX05Kk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CL19sA2jHJkhcYEHVZq90XqPXDmENryTxKhVYBscFr4SdBB55LVhe0MbugjLDhvrp
	 Q/jExU0ziUatJ1MnUt5xjLyUMqMaYhafXx4Sg5V0kzmsWZUpLoBfwvuCiXQGyO+Lt+
	 59R0w/MnODwH2WCFTKIjbEc6gsk9MhffrdG/AJ5JERW8q2qrr/5RZf31T8PcX+Y/rg
	 RmUeHf2muggDQ72U9dSYx8hxwcg3SH0piBEUXvg6aDAv9fel/PRfCs72eT10kcR1AZ
	 boij4dgTID1I6Vj+cpqF+92Q97QljNACHvVT7eDyxXVXth9V2qJxsq8A+yz7uQoKQo
	 +hnk4K8gxz9wg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] hwmon: (asus_rog_ryujin) Handle missing driver
 data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arie Miller" <renari@arimil.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260811233943.319729-5-renari@arimil.com>
References: <20260811233943.319729-1-renari@arimil.com>
 <20260811233943.319729-5-renari@arimil.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 Aug 2026 23:51:06 +0000
Message-Id: <20260811235106.76F7C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing size validation of incoming HID reports in `rog_ryujin_raw=
_event` leads to out-of-bounds heap reads.
- [Medium] Early sysfs interaction causes spurious `-ETIMEDOUT` errors beca=
use HID I/O is not started.
- [Medium] The `status_report_request_lock` spinlock provides no mutual exc=
lusion against `rog_ryujin_raw_event`, leading to a race condition on compl=
etions.
--

--- Patch [4]: [PATCH v2 4/4] hwmon: (asus_rog_ryujin) Handle missing drive=
r data ---
commit ec4154bc4d0c91156d0d07b375b65f694f8c0199
Author: Arie Miller <renari@arimil.com>

hwmon: (asus_rog_ryujin) Handle missing driver data

Handles an issue reported by Sashiko where an id could
be missing driver_data.

Link: https://lore.kernel.org/r/5a817284-a9f4-48b2-9f0f-802c5dc6963c@roeck-=
us.net

> diff --git a/drivers/hwmon/asus_rog_ryujin.c b/drivers/hwmon/asus_rog_ryu=
jin.c
> index 9b34c6e06bf78..702edb8313945 100644
> --- a/drivers/hwmon/asus_rog_ryujin.c
> +++ b/drivers/hwmon/asus_rog_ryujin.c
> @@ -506,6 +506,9 @@ static int rog_ryujin_probe(struct hid_device *hdev, =
const struct hid_device_id
>  	struct rog_ryujin_data *priv;
>  	int ret;
> =20
> +	if (!id->driver_data)
> +		return -EINVAL;
> +
>  	priv =3D devm_kzalloc(&hdev->dev, sizeof(*priv), GFP_KERNEL);
>  	if (!priv)
>  		return -ENOMEM;

[Severity: High]
This isn't a bug introduced by this patch, but is there a missing size
validation in rog_ryujin_raw_event()?

If a malicious or malfunctioning HID device sends a short report matching t=
he
expected prefix but lacking the required data fields, the size parameter
doesn't seem to be validated:

drivers/hwmon/asus_rog_ryujin.c:rog_ryujin_raw_event() {
    ...
	if (data[1] =3D=3D RYUJIN_GET_COOLER_STATUS_CMD_RESPONSE) {
		/* Received coolant temp and speeds of pump and internal fan */
		priv->temp_input[0] =3D data[priv->info->temp_offset] * 1000 +
    ...
}

Could accessing fixed and dynamic offsets here lead to an out-of-bounds heap
read, potentially resulting in a KASAN crash or leaking adjacent heap memory
contents?

[Severity: Medium]
This is a pre-existing issue, but can early sysfs interaction cause
spurious -ETIMEDOUT errors during device initialization?

The hwmon device is registered and exposed to userspace here:

drivers/hwmon/asus_rog_ryujin.c:rog_ryujin_probe() {
    ...
	priv->hwmon_dev =3D hwmon_device_register_with_info(&hdev->dev, "rog_ryuji=
n",
							  priv, &rog_ryujin_chip_info, NULL);
    ...
}

If userspace accesses the hwmon sysfs attributes immediately after they are
created, but before the probe() callback returns, will incoming hardware
reports be rejected with -EBUSY because __hid_device_probe() holds
driver_input_lock?

Since HID I/O is not explicitly started before registering the hwmon device,
might this race condition lead to dropped HID events?

[Severity: Medium]
This isn't a bug introduced by this patch, but does the
status_report_request_lock spinlock actually protect the completion structu=
res?

The spinlock is acquired to protect reinit_completion():

drivers/hwmon/asus_rog_ryujin.c:rog_ryujin_execute_cmd() {
    ...
	spin_lock_bh(&priv->status_report_request_lock);
	reinit_completion(status_completion);
	spin_unlock_bh(&priv->status_report_request_lock);
    ...
}

However, the event handler accesses and modifies the completion structures
without acquiring status_report_request_lock:

drivers/hwmon/asus_rog_ryujin.c:rog_ryujin_raw_event() {
    ...
	if (!completion_done(&priv->cooler_status_received))
		complete_all(&priv->cooler_status_received);
    ...
}

If complete_all() is called concurrently with reinit_completion() from a
userspace sysfs read/write, could this race condition corrupt the completion
done count and cause sysfs operations to fail with -ETIMEDOUT or return sta=
le
data?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260811233943.3197=
29-1-renari@arimil.com?part=3D4
