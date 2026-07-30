Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093BF282F1C
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Jul 2026 09:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785404632; cv=none; b=L9i9nuRgqTFLqcE96/fOPtiR4CeE30HoEc60kQW1Vu8uF5CgNjxpxPF8ud8qwycYkV43UbX+1vf56WEoVLvQv7Y7dtGdtmAig2NHxgsBNjtHe255u1kvR9GZDA2Y3xHB7fSR7+JpAKrcDkvNlrQQkCuSOHQBFwuBCoZjcgMM2y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785404632; c=relaxed/simple;
	bh=Wh0HiAh4aMYYOpUpUihXsjGI0Y1sYVyMUHnBrZb0/M0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=esirOv/uf8UVg+WlefkgSiJoGQNjp3Yx37SwyDffex2eDUCEV8vlcxI825WHEZ6VRt2TcwOi6jqvwipHjEGoNuDAZBvu0aXsio5qC6QvIYzdkcDAcNYTRqG/ZoapeNcXuaagxxFvyHt5V8VQV+An4A3mx2ruQ0EgzPdhlKQCCJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VPpamArP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VPpamArP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95BDF1F000E9;
	Thu, 30 Jul 2026 09:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785404630;
	bh=P9+kFLNmkQaPSS4YFp348B0T8OJXhQQXxTGSYi+c814=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VPpamArPd7lxj2oQgiIsL89kQvLoM2w3Gu/CK5F9lej8rqdg9FZ9oGTig529SJiJQ
	 kTvKSiOSqHJtixLK06IjMEKrhcD7kuoZ2oTf5vBVnS6L2TLSFrqEpoxhag35QzdVDQ
	 XDAD6rNqtol5XRX/VvyW1mvWhYkQo3YMhHT3YrJhX0UqmTTGcp0Pk0ZJl4GaS0VooR
	 hLvPRhTQ+v1RZtP2rFrI3x3le9WWmQOeD/AiIYnZviTi3z4g3eH+QFOw37Y+cenYOl
	 ossSQlJLV+x2zYrCA2VTIkmsB/4K2lc9iCrjMaQymoSCgf14IuXquWK/+l07DxLLLY
	 DnlIZ9WBmjzNw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] hwmon: (lm90) Switch channel parsing to fwnode APIs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Flaviu Nistor" <flaviu.nistor@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260730091409.10544-1-flaviu.nistor@gmail.com>
References: <20260730091409.10544-1-flaviu.nistor@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 09:43:50 +0000
Message-Id: <20260730094350.95BDF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Switching to `device_for_each_child_node_scoped()` exposes a c=
ritical pre-existing bug in the core `fwnode_get_next_child_node()` which c=
auses an infinite loop and double-frees if a device has both OF and seconda=
ry firmware nodes.
--

--- Patch [1]: [PATCH v3] hwmon: (lm90) Switch channel parsing to fwnode AP=
Is ---
commit 39e5cdd2d72333fe0fa7b34c25ad27651948158c
Author: Flaviu Nistor <flaviu.nistor@gmail.com>

hwmon: (lm90) Switch channel parsing to fwnode APIs

Replace OF property handling with fwnode in the probe function to read
the channels properties, improving the driver compatibility since this
method is not limited to Device Tree only.
Add also the needed headers for explicit include and clean up related
function naming.

> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
> index 4b9c0ccdf2609..03779c1a251a2 100644
> --- a/drivers/hwmon/lm90.c
> +++ b/drivers/hwmon/lm90.c

[ ... ]

> @@ -2739,18 +2744,17 @@ static int lm90_probe_channel_from_dt(struct i2c_=
client *client,
>  	return 0;
>  }
> =20
> -static int lm90_parse_dt_channel_info(struct i2c_client *client,
> -				      struct lm90_data *data)
> +static int lm90_parse_channel_info(struct i2c_client *client,
> +				   struct lm90_data *data)
>  {
>  	int err;
>  	struct device *dev =3D &client->dev;
> -	const struct device_node *np =3D dev->of_node;
> =20
> -	for_each_child_of_node_scoped(np, child) {
> -		if (strcmp(child->name, "channel"))
> +	device_for_each_child_node_scoped(dev, child) {
> +		if (!fwnode_name_eq(child, "channel"))

[Severity: Critical]
This is a pre-existing issue, but switching to
device_for_each_child_node_scoped() exposes this driver to a regression
in the core fwnode_get_next_child_node() framework.

If a device has both Open Firmware and secondary firmware nodes (swnodes),
can this iterator trigger an infinite loop and a double-free?

When transitioning from the primary Open Firmware fwnode to the secondary
swnode, the core fwnode_get_next_child_node() passes the already-put
primary child to the secondary fwnode backend:

drivers/base/property.c:fwnode_get_next_child_node() {
	...
	/* When no more children in primary, continue with secondary */
	return fwnode_call_ptr_op(fwnode->secondary, get_next_child_node, child);
}

Since the passed child is an Open Firmware node rather than a software node,
to_swnode() inside software_node_get_next_child() returns a null pointer.
This causes it to drop the reference on the node a second time (the first
drop was in of_get_next_available_child()), leading to a double-free:

drivers/base/swnode.c:software_node_get_next_child() {
	...
	if (!p || list_empty(&p->children) ||
	    (c && list_is_last(&c->entry, &p->children))) {
		fwnode_handle_put(child);
		return NULL;
	}
}

Furthermore, on the next iteration, the returned secondary child is passed
back to the primary backend. Since it is not an Open Firmware node,
to_of_node() returns a null pointer, causing of_get_next_available_child()
to restart the search and return the first node again, creating an
infinite loop between node types.

Could this driver probe freeze the kernel on systems where a software node
is attached alongside Open Firmware child nodes?

>  			continue;
> =20
> -		err =3D lm90_probe_channel_from_dt(client, child, data);
> +		err =3D lm90_probe_channel(client, child, data);
>  		if (err)
>  			return err;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730091409.1054=
4-1-flaviu.nistor@gmail.com?part=3D1
