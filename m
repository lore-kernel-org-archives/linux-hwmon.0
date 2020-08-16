Return-Path: <SRS0=JR9X=B2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1FB5C433E3
	for <linux-hwmon@archiver.kernel.org>; Sun, 16 Aug 2020 18:17:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC12720829
	for <linux-hwmon@archiver.kernel.org>; Sun, 16 Aug 2020 18:17:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="eCciP8ej"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729231AbgHPSRr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 16 Aug 2020 14:17:47 -0400
Received: from mail-40130.protonmail.ch ([185.70.40.130]:23943 "EHLO
        mail-40130.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726331AbgHPSRq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 16 Aug 2020 14:17:46 -0400
Date:   Sun, 16 Aug 2020 18:17:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1597601863;
        bh=eBqLsj47doXca2iFNAWhBlSADiPFuPjUdnh5Fb+Ss4c=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=eCciP8ejnXFaqq2kVCjjXs0hVsM+cg4hMW6yUV+DL8Lj+BHXsUP9Qpb555mJkidZG
         /VKsc+kle7cEnQLrDBilaVuCnOXfxSFO+ZBANv8Eh2FGruE2Wn9eUfUFlCRcLIThV+
         8ZhuO4qoFuMUl77ZM8/+5JJPgTQxshYHvzQT8knE=
To:     jaap aarts <jaap.aarts1@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH V6] hwmon: add fan/pwm driver for corsair h100i platinum
Message-ID: <odhPvTQHPORgr-0oIThKQfchHX1_snHADl8aZCGSc771d492UJqUwFJEuC3PkRwlwQmxXU-OZJfvsvbvBFANCk_JO2yAfcXI82q3FyxwtF8=@protonmail.com>
In-Reply-To: <20200816164616.417500-1-jaap.aarts1@gmail.com>
References: <20200816164616.417500-1-jaap.aarts1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

> [...]
> +static int hwmon_init(struct hydro_i_pro_device *hdev)
> +{
> +=09u8 fan_id;
> +=09struct device *hwmon_dev;
> +=09struct hwmon_fan_data *fan;
> +=09struct hwmon_data *data;
> +=09struct hwmon_chip_info *hwmon_info;
> +
> +=09data =3D devm_kzalloc(&hdev->udev->dev, sizeof(*data), GFP_KERNEL);
> +=09if (!data)
> +=09=09return -ENOMEM;
> +=09hwmon_info =3D
> +=09=09devm_kzalloc(&hdev->udev->dev, sizeof(hwmon_info), GFP_KERNEL);
> +=09if (!hwmon_info) {
> +=09=09free(data);
> +=09=09return -ENOMEM;
> +=09}

If you use devm_kzalloc() there is no need to free it. (But see my comments=
 below.)
And you missed a '*' in the sizeof.


> +
> +=09/* You did something bad!! Either adjust  MAX_FAN_COUNT or the fancou=
nt for the config!*/
> +=09WARN_ON(hdev->config->fancount >=3D MAX_PWM_CHANNEL_COUNT);
> +=09data->channel_count =3D
> +=09=09clamp_val(hdev->config->fancount, 0, MAX_PWM_CHANNEL_COUNT);
> +
> +=09/* For each fan create a data channel a fan config entry and a pwm co=
nfig entry */
> +=09for (fan_id =3D 0; fan_id < data->channel_count; fan_id++) {
> +=09=09fan =3D devm_kzalloc(&hdev->udev->dev, sizeof(fan), GFP_KERNEL);
> +=09=09if (!fan)
> +=09=09=09return -ENOMEM;
> +
> +=09=09fan->fan_channel =3D fan_id;
> +=09=09fan->mode =3D 0;
> +=09=09data->channel_data[fan_id] =3D fan;
> +=09}
> +
> +=09hwmon_info->ops =3D &i_pro_ops;
> +=09hwmon_info->info =3D hdev->config->hwmon_info;
> +
> +=09data->hdev =3D hdev;
> +=09hwmon_dev =3D devm_hwmon_device_register_with_info(
> +=09=09&hdev->udev->dev, hdev->config->name, data, hwmon_info, NULL);
> +=09if (IS_ERR(hwmon_dev))
> +=09=09return PTR_ERR(hwmon_dev);
> +
> +=09dev_info(&hdev->udev->dev, "setup hwmon for %s\n", hdev->config->name=
);
> +=09return 0;
> +}
> [...]
> +static void astk_delete(struct hydro_i_pro_device *hdev)
> +{
> +=09usb_put_intf(hdev->interface);
> +=09usb_put_dev(hdev->udev);
> +=09mutex_destroy(&hdev->io_mutex);

Now that you changed 'hdev' to be devm allocated, this may lead to a proble=
m here,
since "putting" the usb device may cause all associated allocations to be f=
reed,
which means that 'hdev' may be freed by the time you want to destroy the mu=
tex.


> +}
> +
> +static int astk_probe(struct usb_interface *interface,
> +=09=09      const struct usb_device_id *id)
> +{
> +=09struct usb_device *udev =3D usb_get_dev(interface_to_usbdev(interface=
));
> +=09struct hydro_i_pro_device *hdev;
> +=09int retval;
> +=09struct usb_endpoint_descriptor *bulk_in, *bulk_out;
> +
> +=09hdev =3D devm_kzalloc(&udev->dev, sizeof(*hdev), GFP_KERNEL);
> +
> +=09if (!hdev) {
> +=09=09retval =3D -ENOMEM;
> +=09=09goto exit;
> +=09}
> +
> +=09hdev->config =3D (const struct device_config *)id->driver_info;
> +=09/* You should set the driver_info to a pointer to the correct configu=
ration!!*/
> +=09WARN_ON(!hdev->config);
> +
> +=09retval =3D usb_find_common_endpoints(interface->cur_altsetting, &bulk=
_in,
> +=09=09=09=09=09   &bulk_out, NULL, NULL);
> +=09if (retval) {
> +=09=09kfree(hdev);
> +=09=09goto exit;
> +=09}
> +
> +=09hdev->udev =3D ;
> +=09hdev->interface =3D usb_get_intf(interface);
> +
> +=09/*
> +=09 * set up the endpoint information
> +=09 * use only the first bulk-in and bulk-out endpoints
> +=09 */
> +=09hdev->bulk_in_size =3D usb_endpoint_maxp(bulk_in);
> +=09hdev->bulk_in_buffer =3D
> +=09=09devm_kzalloc(&hdev->udev->dev, hdev->bulk_in_size, GFP_KERNEL);
> +=09hdev->bulk_in_endpointAddr =3D bulk_in->bEndpointAddress;
> +=09if (!hdev->bulk_in_buffer) {
> +=09=09kfree(hdev);
> +=09=09goto exit;
> +=09}
> +
> +=09hdev->bulk_out_size =3D usb_endpoint_maxp(bulk_out);
> +=09hdev->bulk_out_buffer =3D
> +=09=09devm_kzalloc(&hdev->udev->dev, hdev->bulk_out_size, GFP_KERNEL);
> +=09hdev->bulk_out_endpointAddr =3D bulk_out->bEndpointAddress;
> +=09if (!hdev->bulk_out_buffer) {
> +=09=09kfree(hdev);
> +=09=09kfree(hdev->bulk_in_buffer);
> +=09=09goto exit;
> +=09}
> +
> +=09retval =3D init_device(hdev->udev);
> +=09if (retval) {
> +=09=09dev_err(&interface->dev, "failed initialising %s:%d\n",
> +=09=09=09hdev->config->name, retval);
> +=09=09kfree(hdev);
> +=09=09kfree(hdev->bulk_in_buffer);
> +=09=09kfree(hdev->bulk_out_buffer);
> +=09=09goto exit;
> +=09}
> +
> +=09retval =3D hwmon_init(hdev);
> +=09if (retval) {
> +=09=09dev_err(&interface->dev, "failed initialising hwmon %s:%d\n",
> +=09=09=09hdev->config->name, retval);
> +=09=09kfree(hdev);
> +=09=09kfree(hdev->bulk_in_buffer);
> +=09=09kfree(hdev->bulk_out_buffer);

I hope what I said wasn't confusing, but - like you said - if you use
devm_* you don't need to explicitly free it. Furthermore, you access a poin=
ter
that has already been freed here.

devm_k.alloc() and devm_kfree() OR k.alloc() and kfree(), do not mix the tw=
o.
In case of failure I think it makes sense to free the resources either way,=
 but
it is not strictly necessary since devm resources will be freed when the de=
vice
is gone.


> +=09=09goto exit;
> +=09}
> +
> +=09usb_set_intfdata(interface, hdev);
> +=09mutex_init(&hdev->io_mutex);
> +exit:
> +=09return retval;
> +}
> [...]


Please think more about memory management and how it should work in this mo=
dule.
Only manage devm resources between "getting" and "putting" the device.
Don't do it after "putting" or before "getting" the device.
And please compile and test your code (among other things) before submittin=
g as per
https://www.kernel.org/doc/html/latest/hwmon/submitting-patches.html


Barnab=C3=A1s P=C5=91cze
