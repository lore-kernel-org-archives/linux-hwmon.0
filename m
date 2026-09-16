Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53884EE873
	for <linux-hwmon@vger.kernel.org>; Wed, 16 Sep 2026 13:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789563693; cv=none; b=iWZyGUIGN/ZSwISzUtNDSAZ4KyctuWoZq8z++G5xYzqbBDA0ZSqy6uQU9VgiOzG+RRrdElH/ZC9EhyjU5npsgOLPRXDni2ZOKezY8ydTM/Ue5emAZIY0upfzXjF+tRza6qpQrZRZ+qxry5CwcZHlBbWIUp4sOwQUDNiGtL/FKs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789563693; c=relaxed/simple;
	bh=9Q9J73qi6nlaR+ALL3stMitLVEeYmfR69v79qdvQNVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pWAkfaIEtiy6BmRLBqrS+saN3EQlBfCO7sSAEsgKTYsH7k6PzTidAzhFMSWiarP8iVHgKLNNZjQr0/3CW7xNQHU0TlK9AAOOLz3S2tyMH77se7t7YJz9mZC3UyY7APSaTpQy9kLCqouhLC0NKIzbdDxXHnDcCsIGPu3QgmZ2/iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lqOhPR23; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lqOhPR23"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78A781F0089D
	for <linux-hwmon@vger.kernel.org>; Wed, 16 Sep 2026 13:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789563691;
	bh=jj4FtNav4TXPQvbVBqNyUNxnC9aC+86pLnGTjTl9G+U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lqOhPR23imVGibuT+IQxwHW1NzR7E0mGwlDdW7PkPChAidRFDD/AK3aiww09+NiHW
	 LxLSKFFBCfnv5e9PZJ52P+dQAu+Q2GUGetsPdcYFj8prRtvQdjnJ5+NwVKnC1kqJkn
	 giTfzSjOgE3ygkeZ9XQz0sy8p9pffILoNoTpPSZEXubl80DuvEk3e3VWKQ0fmJeXfA
	 uK6uHdgi30PQqRTj2GKl2apn2mMecyj5sg2QEVFknpnaXYQIml7qSMZMFbiLr+2uiK
	 biSlzLZG5NRBBsaRrJI70XRoBGCxDNaNEJ1A/fh2ldfLNOpEDUbEFbuYhl5YKqmQJg
	 2Zn4OAOQpSRdQ==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f1651bso893365e87.3
        for <linux-hwmon@vger.kernel.org>; Wed, 16 Sep 2026 06:01:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByA8jDmySjMaYYrgm1yp3atFXb52CKfF+rciwox3PbhzyFcZd5i5cQvB4ypRw7X7xlACj3v3AYtpD7Ryw==@vger.kernel.org
X-Gm-Message-State: AFuF++nLISBhypvwAgkglZ41BSj8zbj3vtxnHlFsDl2DH1PtUnllSJEU
	VGFoEGTg8mS4FmT+gM0kKJIGli7Br6kjn2kfZp9SSPWJKmNCmvZn3ib6LSusUFiquxfsx9xXrbl
	H4THrGMHytFgtRid3JlixoWeTi91j+dY=
X-Received: by 2002:a05:6512:2347:b0:5b6:184c:7da3 with SMTP id
 2adb3069b0e04-5b8b664e970mr692970e87.44.1789563689604; Wed, 16 Sep 2026
 06:01:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913231410.416922-1-jordan@brough.org> <20260913231410.416922-2-jordan@brough.org>
In-Reply-To: <20260913231410.416922-2-jordan@brough.org>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Wed, 16 Sep 2026 15:00:07 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jajXFU8B-YLirtH3NTjM-+bXe2M2+xuJWJbwK4m9O=Zg@mail.gmail.com>
X-Gm-Features: AcwNN1UU6k1jyFh_G-zYTLAqbYe_0fCs1p5wXgbrrbSo74l9sMUVYr1q5lznoS4
Message-ID: <CAJZ5v0jajXFU8B-YLirtH3NTjM-+bXe2M2+xuJWJbwK4m9O=Zg@mail.gmail.com>
Subject: Re: [PATCH 1/2] ACPI: sbs: add battery hook mechanism for
 SBS-registered batteries
To: Jordan Brough <jordan@brough.org>
Cc: rafael@kernel.org, rydberg@bitmath.org, linux@roeck-us.net, 
	lenb@kernel.org, maciej.wieczor-retman@intel.com, pawel.chmielewski@intel.com, 
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, 
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 1:14=E2=80=AFAM Jordan Brough <jordan@brough.org> w=
rote:
>
> drivers/acpi/battery.c provides a battery_hook_register()/unregister()
> mechanism that lets other drivers (e.g. hwmon drivers exposing vendor-
> specific charge control) attach extra power_supply properties to an
> ACPI Control Method Battery (HID PNP0C0A, "CmBatt").
>
> Some machines instead expose their battery through the ACPI Smart
> Battery System (HID ACPI0002, "SBS") driver in drivers/acpi/sbs.c,
> which has no equivalent hook point. On these machines a hwmon driver
> has no supported way to attach additional properties to the battery's
> power_supply device.
>
> Add a parallel sbs_battery_hook_register()/unregister() mechanism to
> drivers/acpi/sbs.c, mirroring the existing CmBatt hook API in name and
> behavior so that callers can support both battery registration paths
> symmetrically. This is purely additive: no existing hook consumer or
> code path in drivers/acpi/battery.c is touched, and sbs.c's own
> behavior is unchanged for any driver that does not call the new API.
>
> This is a prerequisite for hwmon/applesmc gaining
> charge_control_end_threshold support, since the Intel MacBook hardware
> being targeted registers its battery via SBS, not CmBatt.
>
> Signed-off-by: Jordan Brough <jordan@brough.org>

Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

and feel free to route this patch along with the hwmon changes depending on=
 it.

Thanks!

> ---
>  drivers/acpi/sbs.c     | 147 ++++++++++++++++++++++++++++++++++++++++-
>  include/acpi/battery.h |  16 +++++
>  2 files changed, 162 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/acpi/sbs.c b/drivers/acpi/sbs.c
> index 86b7c797585..305bf62eae3 100644
> --- a/drivers/acpi/sbs.c
> +++ b/drivers/acpi/sbs.c
> @@ -10,6 +10,7 @@
>  #define pr_fmt(fmt) "ACPI: " fmt
>
>  #include <linux/init.h>
> +#include <linux/list.h>
>  #include <linux/slab.h>
>  #include <linux/module.h>
>  #include <linux/moduleparam.h>
> @@ -54,6 +55,7 @@ struct acpi_battery {
>         struct power_supply *bat;
>         struct power_supply_desc bat_desc;
>         struct acpi_sbs *sbs;
> +       struct list_head list;          /* node in sbs_hook_battery_list =
*/
>         unsigned long update_time;
>         char name[8];
>         char manufacturer_name[ACPI_SBS_BLOCK_MAX];
> @@ -518,6 +520,145 @@ static int acpi_battery_read(struct acpi_battery *b=
attery)
>         return result;
>  }
>
> +/*
> + * Battery hook support, mirroring the mechanism in drivers/acpi/battery=
.c
> + * for batteries registered there. That mechanism only sees batteries
> + * added via drivers/acpi/battery.c, not the ones this driver registers,
> + * so drivers wanting to attach optional functionality (e.g. an extra
> + * power_supply_ext) to an SBS battery need this separate copy; see the
> + * comment above the declarations in include/acpi/battery.h.
> + */
> +static LIST_HEAD(sbs_hook_list);
> +static LIST_HEAD(sbs_hook_battery_list);
> +static DEFINE_MUTEX(sbs_hook_mutex);
> +
> +static void sbs_battery_hook_unregister_unlocked(struct acpi_battery_hoo=
k *hook)
> +{
> +       struct acpi_battery *battery;
> +
> +       /*
> +        * In order to remove a hook, we first need to
> +        * de-register all the batteries that are registered.
> +        */
> +       list_for_each_entry(battery, &sbs_hook_battery_list, list) {
> +               if (!hook->remove_battery(battery->bat, hook))
> +                       power_supply_changed(battery->bat);
> +       }
> +       list_del_init(&hook->list);
> +}
> +
> +void sbs_battery_hook_unregister(struct acpi_battery_hook *hook)
> +{
> +       mutex_lock(&sbs_hook_mutex);
> +       /*
> +        * Ignore already unregistered battery hooks. This might happen
> +        * if a battery hook was previously unloaded due to an error when
> +        * adding a new battery.
> +        */
> +       if (!list_empty(&hook->list))
> +               sbs_battery_hook_unregister_unlocked(hook);
> +       mutex_unlock(&sbs_hook_mutex);
> +}
> +EXPORT_SYMBOL_GPL(sbs_battery_hook_unregister);
> +
> +void sbs_battery_hook_register(struct acpi_battery_hook *hook)
> +{
> +       struct acpi_battery *battery;
> +
> +       mutex_lock(&sbs_hook_mutex);
> +       list_add(&hook->list, &sbs_hook_list);
> +       /*
> +        * Now that the driver is registered, we need
> +        * to notify the hook that a battery is available
> +        * for each battery, so that the driver may add
> +        * its attributes.
> +        */
> +       list_for_each_entry(battery, &sbs_hook_battery_list, list) {
> +               if (hook->add_battery(battery->bat, hook)) {
> +                       /*
> +                        * If a add-battery returns non-zero,
> +                        * the registration of the hook has failed,
> +                        * and we will not add it to the list of loaded
> +                        * hooks.
> +                        */
> +                       pr_err("hook failed to load: %s", hook->name);
> +                       sbs_battery_hook_unregister_unlocked(hook);
> +                       goto end;
> +               }
> +
> +               power_supply_changed(battery->bat);
> +       }
> +       pr_info("new hook: %s\n", hook->name);
> +end:
> +       mutex_unlock(&sbs_hook_mutex);
> +}
> +EXPORT_SYMBOL_GPL(sbs_battery_hook_register);
> +
> +static void devm_sbs_battery_hook_unregister(void *data)
> +{
> +       struct acpi_battery_hook *hook =3D data;
> +
> +       sbs_battery_hook_unregister(hook);
> +}
> +
> +int devm_sbs_battery_hook_register(struct device *dev, struct acpi_batte=
ry_hook *hook)
> +{
> +       sbs_battery_hook_register(hook);
> +
> +       return devm_add_action_or_reset(dev, devm_sbs_battery_hook_unregi=
ster, hook);
> +}
> +EXPORT_SYMBOL_GPL(devm_sbs_battery_hook_register);
> +
> +/*
> + * This function gets called right after the battery sysfs
> + * attributes have been added, so that the drivers that
> + * define custom sysfs attributes can add their own.
> + */
> +static void sbs_battery_hook_add_battery(struct acpi_battery *battery)
> +{
> +       struct acpi_battery_hook *hook_node, *tmp;
> +
> +       mutex_lock(&sbs_hook_mutex);
> +       INIT_LIST_HEAD(&battery->list);
> +       list_add(&battery->list, &sbs_hook_battery_list);
> +       /*
> +        * Since we added a new battery to the list, we need to
> +        * iterate over the hooks and call add_battery for each
> +        * hook that was registered. This usually happens
> +        * when a battery gets hotplugged or initialized
> +        * during the battery module initialization.
> +        */
> +       list_for_each_entry_safe(hook_node, tmp, &sbs_hook_list, list) {
> +               if (hook_node->add_battery(battery->bat, hook_node)) {
> +                       /*
> +                        * The notification of the hook has failed, to
> +                        * prevent further errors we will unload the hook=
.
> +                        */
> +                       pr_err("error in hook, unloading: %s",
> +                              hook_node->name);
> +                       sbs_battery_hook_unregister_unlocked(hook_node);
> +               }
> +       }
> +       mutex_unlock(&sbs_hook_mutex);
> +}
> +
> +static void sbs_battery_hook_remove_battery(struct acpi_battery *battery=
)
> +{
> +       struct acpi_battery_hook *hook;
> +
> +       mutex_lock(&sbs_hook_mutex);
> +       /*
> +        * Before removing the hook, we need to remove all
> +        * custom attributes from the battery.
> +        */
> +       list_for_each_entry(hook, &sbs_hook_list, list) {
> +               hook->remove_battery(battery->bat, hook);
> +       }
> +       /* Then, just remove the battery from the list */
> +       list_del(&battery->list);
> +       mutex_unlock(&sbs_hook_mutex);
> +}
> +
>  /* Smart Battery */
>  static int acpi_battery_add(struct acpi_sbs *sbs, int id)
>  {
> @@ -555,6 +696,8 @@ static int acpi_battery_add(struct acpi_sbs *sbs, int=
 id)
>                 goto end;
>         }
>
> +       sbs_battery_hook_add_battery(battery);
> +
>        end:
>         pr_info("%s [%s]: Battery Slot [%s] (battery %s)\n",
>                ACPI_SBS_DEVICE_NAME, acpi_device_bid(sbs->device),
> @@ -566,8 +709,10 @@ static void acpi_battery_remove(struct acpi_sbs *sbs=
, int id)
>  {
>         struct acpi_battery *battery =3D &sbs->battery[id];
>
> -       if (battery->bat)
> +       if (battery->bat) {
> +               sbs_battery_hook_remove_battery(battery);
>                 power_supply_unregister(battery->bat);
> +       }
>  }
>
>  static int acpi_charger_add(struct acpi_sbs *sbs)
> diff --git a/include/acpi/battery.h b/include/acpi/battery.h
> index c93f16dfb94..ddbfa4ed135 100644
> --- a/include/acpi/battery.h
> +++ b/include/acpi/battery.h
> @@ -18,8 +18,24 @@ struct acpi_battery_hook {
>         struct list_head list;
>  };
>
> +/*
> + * battery_hook_register() and friends only see batteries registered by
> + * drivers/acpi/battery.c, the ACPI Control Method Battery driver (ACPI =
HID
> + * "PNP0C0A"). Batteries registered by drivers/acpi/sbs.c, the ACPI Smar=
t
> + * Battery System driver (ACPI HID "ACPI0002", common on hardware with
> + * SMBus/SBS fuel-gauge chips such as many Intel MacBooks), are invisibl=
e
> + * to them; use the sbs_battery_hook_* equivalents below for those. A
> + * caller wanting to support both kinds of hardware needs two separate
> + * struct acpi_battery_hook instances, one per registration call, since =
a
> + * given instance's embedded list node can only belong to one list at a
> + * time.
> + */
>  void battery_hook_register(struct acpi_battery_hook *hook);
>  void battery_hook_unregister(struct acpi_battery_hook *hook);
>  int devm_battery_hook_register(struct device *dev, struct acpi_battery_h=
ook *hook);
>
> +void sbs_battery_hook_register(struct acpi_battery_hook *hook);
> +void sbs_battery_hook_unregister(struct acpi_battery_hook *hook);
> +int devm_sbs_battery_hook_register(struct device *dev, struct acpi_batte=
ry_hook *hook);
> +
>  #endif
> --
> 2.55.0
>
