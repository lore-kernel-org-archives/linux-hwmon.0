Return-Path: <SRS0=9O35=BY=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C0A6C433E1
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 Aug 2020 23:38:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D61A12068E
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 Aug 2020 23:38:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="qM0m8rf+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbgHNXi0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 14 Aug 2020 19:38:26 -0400
Received: from mail-40140.protonmail.ch ([185.70.40.140]:24628 "EHLO
        mail-40140.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbgHNXi0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 14 Aug 2020 19:38:26 -0400
X-Greylist: delayed 496 seconds by postgrey-1.27 at vger.kernel.org; Fri, 14 Aug 2020 19:38:21 EDT
Date:   Fri, 14 Aug 2020 23:29:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1597447800;
        bh=fcnMsYrg4O52Hy6PTXrw9ept9oY+k4V6I/S2f3Wdgwo=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=qM0m8rf+64MgmsOOpFQHoVkAUw+mZyGQ7eEf+veDNdFPZVGQY2VBvrx/VEcrb16Da
         b3JRdWKMSeVbC7xPB6m6rC0QvMC6iWbBbgS/e67GW06VOerEX48MD2wkNK8IN4q+V3
         ba1a3Zu3BXZMzE9vhcfgWZNISoYZNjSdzY0eB4xg=
To:     jaap aarts <jaap.aarts1@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH V3] hwmon: add fan/pwm driver for corsair h100i platinum
Message-ID: <4hk1tR-p2Dc2UbnNVCvFg4AJsucTKOwY0-Kc934bQ8VJSIhiTm-iw1qb03jNb9mGDBqWhXwlnzwB6vxKNLZf6Sv7ozKSigS9IHInXizzmE0=@protonmail.com>
In-Reply-To: <20200814194202.327141-1-jaap.aarts1@gmail.com>
References: <20200814194202.327141-1-jaap.aarts1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello,

I have a couple suggestions regarding the code.

> [...]
> +/*
> + * Supports following liquid coolers:
> + * H100i platinum
> + *
> + * Other products should work with this driver but no testing has been d=
one.
> + *
> + * Note: platinum is the codename name for pro within the driver, so H10=
0i platinum =3D H100i pro.
> + * But some products are actually calles platinum, these are not intende=
d to be supported.

I think you mean "called", no?


> + *
> + * Note: fan curve control has not been implemented
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/hwmon.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/usb.h>
> +
> +struct device_config {
> +=09u16 vendor_id;
> +=09u16 product_id;
> +=09u8 fancount;

I think you could be more consistent. Later in the code you use 'uin8_t'.
I'd choose one type of fixed-width integer (either {u,s}N or [u]intN_t),
and stick with it.


> +=09const struct hwmon_channel_info **hwmon_info;
> +};
> +
> +struct hydro_i_pro_device {
> +=09struct usb_device *udev;
> +
> +=09const struct device_config *config;
> +
> +=09unsigned char *bulk_out_buffer;
> +=09char *bulk_in_buffer;

Any reason why these two have different sizes? You cast both to
'unsigned char*' in set_fan_target_rpm(), set_fan_pwm_curve(), etc.

As far as I see every device has two buffers for bulk in/out operations.
Isn't it possible that - when multiple processes - try to interact with
the sysfs attributes, more than one USB transactions use the same IO
buffers? I suspect that could lead to data corruption.


> +=09size_t bulk_out_size;
> +=09size_t bulk_in_size;
> +=09char bulk_in_endpointAddr;
> +=09char bulk_out_endpointAddr;
> +
> +=09struct usb_interface *interface; /* the interface for this device */
> +=09struct semaphore
> +=09=09limit_sem; /* limiting the number of writes in progress */

I think you may need a mutex here for reasons outlined in my previous comme=
nt.


> +};
> +
> +struct hwmon_data {
> +=09struct hydro_i_pro_device *hdev;
> +=09int channel_count;
> +=09void **channel_data;

Why is this 'void**'? As far as I see this could be 'struct hwmon_fan_data*=
*'.
But personally I'd use the "flexible array member" feature of C to deal wit=
h this,
or even just a static array that's just big enough.


> +};
> +
> +struct curve_point {
> +=09uint8_t temp;
> +=09uint8_t pwm;
> +};
> +
> +struct hwmon_fan_data {
> +=09char fan_channel;
> +=09long fan_target;
> +=09unsigned char fan_pwm_target;

This is very nitpicky, but any reason why is it not 'uint8_t' like above?
This applies to other variables as well, I think some variables are too big=
 for what they store,
or have a sign, when they could be unsigned.


> +=09long mode;

If the only valid modes are 0, 1, and 2, why the 'long'?


> +=09struct curve_point curve[7];
> +};
> [...]
> +#define SUCCES_LENGTH 3
> +#define SUCCES_CODE 0x12, 0x34
> +
> +static bool check_succes(enum opcodes command, char ret[SUCCES_LENGTH])
> +{
> +=09char success[SUCCES_LENGTH] =3D { command, SUCCES_CODE };
> +=09return strncmp(ret, success, SUCCES_LENGTH) =3D=3D 0;

Any reason why it is not memcmp()?


> +}
> +
> +static const struct device_config *get_device_configuration(u16 vendor_i=
d,
> +=09=09=09=09=09=09=09    u16 product_id)
> +{
> +=09const struct device_config *config;
> +=09int i =3D 0;
> +=09int n =3D ARRAY_SIZE(config_table);
> +=09for (i =3D 0; i < n; i++) {
> +=09=09config =3D &config_table[i];
> +=09=09if (config->vendor_id =3D=3D vendor_id &&
> +=09=09    config->product_id =3D=3D product_id) {
> +=09=09=09return config;
> +=09=09}
> +=09}
> +=09return config;
> +}
> +

I think this can be gotten rid of by utilizing the "driver_info" field of t=
he
usb_device_id struct as seen in drivers/usb/serial/visor.c. That way you co=
uld
store a pointer or an index, and there would be no need to do any lookup. L=
ike this:

{ USB_DEVICE(VID, PID), .driver_info =3D (kernel_ulong_t) &config_table[0] =
}



> +static int set_fan_pwm_curve(struct hydro_i_pro_device *hdev,
> +=09=09=09     struct hwmon_fan_data *fan_data,
> +=09=09=09     struct curve_point point[7])
> +{
> +=09int retval;
> +=09int wrote;
> +=09int sndpipe =3D usb_sndbulkpipe(hdev->udev, hdev->bulk_out_endpointAd=
dr);
> +=09int rcvpipe =3D usb_rcvbulkpipe(hdev->udev, hdev->bulk_in_endpointAdd=
r);
> +=09unsigned char *send_buf =3D hdev->bulk_out_buffer;
> +=09unsigned char *recv_buf =3D hdev->bulk_in_buffer;
> +
> +=09memcpy(fan_data->curve, point, sizeof(fan_data->curve));
> +
> +=09send_buf[0] =3D PWM_FAN_CURVE_CMD;
> +=09send_buf[1] =3D fan_data->fan_channel;
> +=09send_buf[2] =3D point[0].temp;
> +=09send_buf[3] =3D point[1].temp;
> +=09send_buf[4] =3D point[2].temp;
> +=09send_buf[5] =3D point[3].temp;
> +=09send_buf[6] =3D point[4].temp;
> +=09send_buf[7] =3D point[5].temp;
> +=09send_buf[8] =3D point[6].temp;
> +=09send_buf[9] =3D point[0].pwm;
> +=09send_buf[10] =3D point[1].pwm;
> +=09send_buf[11] =3D point[2].pwm;
> +=09send_buf[12] =3D point[3].pwm;
> +=09send_buf[13] =3D point[4].pwm;
> +=09send_buf[14] =3D point[5].pwm;
> +=09send_buf[15] =3D point[6].pwm;
> +
> +=09retval =3D usb_bulk_msg(hdev->udev, sndpipe, send_buf, 16, &wrote,
> +=09=09=09      BULK_TIMEOUT);
> +=09if (retval)
> +=09=09return retval;
> +
> +=09retval =3D usb_bulk_msg(hdev->udev, rcvpipe, recv_buf, 4, &wrote,
> +=09=09=09      BULK_TIMEOUT);
> +=09if (retval)
> +=09=09return retval;
> +
> +=09if (!check_succes(send_buf[0], recv_buf)) {
> +=09=09dev_info(&hdev->udev->dev,
> +=09=09=09 "[*] failed setting fan curve %d,%d,%d/%d\n",
> +=09=09=09 recv_buf[0], recv_buf[1], recv_buf[2], recv_buf[3]);
> +=09=09return -EINVAL;
> +=09}
> +=09return 0;
> +}
> +
> +static int set_fan_target_rpm(struct hydro_i_pro_device *hdev,
> +=09=09=09      struct hwmon_fan_data *fan_data, long val)
> +{
> +=09int retval;
> +=09int wrote;
> +=09int sndpipe =3D usb_sndbulkpipe(hdev->udev, hdev->bulk_out_endpointAd=
dr);
> +=09int rcvpipe =3D usb_rcvbulkpipe(hdev->udev, hdev->bulk_in_endpointAdd=
r);
> +
> +=09unsigned char *send_buf =3D hdev->bulk_out_buffer;
> +=09unsigned char *recv_buf =3D hdev->bulk_in_buffer;
> +
> +=09fan_data->fan_target =3D val;
> +=09fan_data->fan_pwm_target =3D 0;
> +
> +=09send_buf[0] =3D RPM_FAN_TARGET_CMD;
> +=09send_buf[1] =3D fan_data->fan_channel;
> +=09send_buf[2] =3D (fan_data->fan_target >> 8);
> +=09send_buf[3] =3D fan_data->fan_target;

As far as I see 'fan_data->fan_target' is an unsigned 16 bit number, so any=
thing that is
out of range should be rejected  - preferably in hwmon_write() - with -EINV=
AL in my opinion,
since 'fan_data->fan_target' may not accurately represent the state of the =
hardware
if other values are allowed.

The lack of range checking applies to other parts of the code as well.


> +
> +=09retval =3D usb_bulk_msg(hdev->udev, sndpipe, send_buf, 4, &wrote,
> +=09=09=09      BULK_TIMEOUT);
> +=09if (retval)
> +=09=09return retval;
> +
> +=09retval =3D usb_bulk_msg(hdev->udev, rcvpipe, recv_buf, 6, &wrote,
> +=09=09=09      BULK_TIMEOUT);
> +=09if (retval)
> +=09=09return retval;
> +
> +=09if (!check_succes(send_buf[0], recv_buf)) {
> +=09=09dev_info(&hdev->udev->dev,
> +=09=09=09 "[*] failed setting fan rpm %d,%d,%d/%d\n",
> +=09=09=09 recv_buf[0], recv_buf[1], recv_buf[2], recv_buf[3]);
> +=09=09return -EINVAL;
> +=09}
> +=09return 0;
> +}
> +
> +static int get_fan_current_rpm(struct hydro_i_pro_device *hdev,
> +=09=09=09       struct hwmon_fan_data *fan_data, long *val)
> +{
> +=09int retval;
> +=09int wrote;
> +=09int sndpipe =3D usb_sndbulkpipe(hdev->udev, hdev->bulk_out_endpointAd=
dr);
> +=09int rcvpipe =3D usb_rcvbulkpipe(hdev->udev, hdev->bulk_in_endpointAdd=
r);
> +
> +=09unsigned char *send_buf =3D hdev->bulk_out_buffer;
> +=09unsigned char *recv_buf =3D hdev->bulk_in_buffer;
> +
> +=09send_buf[0] =3D PWM_GET_CURRENT_CMD;
> +=09send_buf[1] =3D fan_data->fan_channel;
> +
> +=09retval =3D usb_bulk_msg(hdev->udev, sndpipe, send_buf, 2, &wrote,
> +=09=09=09      BULK_TIMEOUT);
> +=09if (retval)
> +=09=09return retval;
> +
> +=09retval =3D usb_bulk_msg(hdev->udev, rcvpipe, recv_buf, 6, &wrote,
> +=09=09=09      BULK_TIMEOUT);
> +=09if (retval)
> +=09=09return retval;
> +
> +=09if (!check_succes(send_buf[0], recv_buf) ||
> +=09    recv_buf[3] !=3D fan_data->fan_channel) {
> +=09=09dev_info(&hdev->udev->dev,
> +=09=09=09 "[*] failed retrieving fan rmp %d,%d,%d/%d\n",
> +=09=09=09 recv_buf[0], recv_buf[1], recv_buf[2], recv_buf[3]);
> +=09=09return -EINVAL;
> +=09}
> +
> +=09*val =3D ((recv_buf[4]) << 8) + recv_buf[5];
> +=09return 0;
> +}
> +
> +static int set_fan_target_pwm(struct hydro_i_pro_device *hdev,
> +=09=09=09      struct hwmon_fan_data *fan_data, long val)
> +{
> +=09int retval;
> +=09int wrote;
> +=09int sndpipe =3D usb_sndbulkpipe(hdev->udev, hdev->bulk_out_endpointAd=
dr);
> +=09int rcvpipe =3D usb_rcvbulkpipe(hdev->udev, hdev->bulk_in_endpointAdd=
r);
> +
> +=09unsigned char *send_buf =3D hdev->bulk_out_buffer;
> +=09unsigned char *recv_buf =3D hdev->bulk_in_buffer;
> +
> +=09fan_data->fan_pwm_target =3D val;
> +=09fan_data->fan_target =3D 0;
> +
> +=09send_buf[0] =3D PWM_FAN_TARGET_CMD;
> +=09send_buf[1] =3D fan_data->fan_channel;
> +=09send_buf[3] =3D fan_data->fan_pwm_target;
> +
> +=09retval =3D usb_bulk_msg(hdev->udev, sndpipe, send_buf, 4, &wrote,
> +=09=09=09      BULK_TIMEOUT);
> +=09if (retval)
> +=09=09return retval;
> +
> +=09retval =3D usb_bulk_msg(hdev->udev, rcvpipe, recv_buf, 6, &wrote,
> +=09=09=09      BULK_TIMEOUT);
> +=09if (retval)
> +=09=09return retval;
> +
> +=09if (!check_succes(send_buf[0], recv_buf)) {
> +=09=09dev_info(&hdev->udev->dev,
> +=09=09=09 "[*] failed setting fan pwm %d,%d,%d/%d\n",
> +=09=09=09 recv_buf[0], recv_buf[1], recv_buf[2], recv_buf[3]);
> +=09=09return -EINVAL;
> +=09}
> +=09return 0;
> +}
> +

The previous four functions are structurally more or less the same,
I think the USB related parts could be placed into their own dedicated func=
tion.


> [...]
> +static int hwmon_write(struct device *dev, enum hwmon_sensor_types type,
> +=09=09       u32 attr, int channel, long val)
> +{
> +=09struct hwmon_data *data =3D dev_get_drvdata(dev);
> +=09struct hydro_i_pro_device *hdev =3D data->hdev;
> +=09struct hwmon_fan_data *fan_data;
> +=09int retval =3D 0;
> +
> +=09if (channel >=3D data->channel_count)
> +=09=09return -ECHRNG;
> +

I don't think it's possible that this function is called with an invalid 'c=
hannel' value.


> +=09switch (type) {
> +=09case hwmon_fan:
> +=09=09switch (attr) {
> +=09=09case hwmon_fan_target:
> +=09=09=09fan_data =3D data->channel_data[channel];
> +=09=09=09if (fan_data->mode !=3D 1)
> +=09=09=09=09return -EINVAL;
> +
> +=09=09=09retval =3D usb_autopm_get_interface(hdev->interface);
> +=09=09=09if (retval)
> +=09=09=09=09goto exit;
> +
> +=09=09=09if (down_trylock(&hdev->limit_sem)) {
> +=09=09=09=09retval =3D -EAGAIN;
> +=09=09=09=09goto cleanup_interface;
> +=09=09=09}
> +
> +=09=09=09retval =3D set_fan_target_rpm(hdev, fan_data, val);
> +=09=09=09if (retval)
> +=09=09=09=09goto cleanup;
> +
> +=09=09=09break;
> +=09=09default:
> +=09=09=09return -EINVAL;
> +=09=09}
> +=09=09goto exit;
> +=09case hwmon_pwm:
> +=09=09switch (attr) {
> +=09=09case hwmon_pwm_input:
> +=09=09=09fan_data =3D data->channel_data[channel];
> +=09=09=09if (fan_data->mode !=3D 1)
> +=09=09=09=09return -EINVAL;
> +
> +=09=09=09retval =3D usb_autopm_get_interface(hdev->interface);
> +=09=09=09if (retval)
> +=09=09=09=09goto exit;
> +
> +=09=09=09if (down_trylock(&hdev->limit_sem)) {
> +=09=09=09=09retval =3D -EAGAIN;
> +=09=09=09=09goto cleanup_interface;
> +=09=09=09}
> +
> +=09=09=09retval =3D set_fan_target_pwm(hdev, fan_data, val);
> +=09=09=09if (retval)
> +=09=09=09=09goto cleanup;
> +
> +=09=09=09break;
> +=09=09case hwmon_pwm_enable:
> +=09=09=09fan_data =3D data->channel_data[channel];
> +
> +=09=09=09retval =3D usb_autopm_get_interface(hdev->interface);
> +=09=09=09if (retval)
> +=09=09=09=09goto exit;
> +
> +=09=09=09if (down_trylock(&hdev->limit_sem)) {
> +=09=09=09=09retval =3D -EAGAIN;
> +=09=09=09=09goto cleanup_interface;
> +=09=09=09}
> +=09=09=09fan_data->mode =3D val;
> +

The mode is stored even if it is out of range, or if the actual "setting" o=
f the mode
fails, hence it is possible that the value does not reflect the state of th=
e hardware
accurately.


> +=09=09=09switch (val) {
> +=09=09=09case 0:
> +=09=09=09=09set_fan_pwm_curve(hdev, fan_data,
> +=09=09=09=09=09=09  default_curve);
> +=09=09=09=09break;
> +=09=09=09case 1:
> +=09=09=09=09if (fan_data->fan_target !=3D 0) {
> +=09=09=09=09=09retval =3D set_fan_target_rpm(
> +=09=09=09=09=09=09hdev, fan_data,
> +=09=09=09=09=09=09fan_data->fan_target);
> +=09=09=09=09=09if (retval)
> +=09=09=09=09=09=09goto cleanup;
> +=09=09=09=09} else if (fan_data->fan_pwm_target !=3D 0) {
> +=09=09=09=09=09retval =3D set_fan_target_pwm(
> +=09=09=09=09=09=09hdev, fan_data,
> +=09=09=09=09=09=09fan_data->fan_pwm_target);
> +=09=09=09=09=09if (retval)
> +=09=09=09=09=09=09goto cleanup;
> +=09=09=09=09}
> +=09=09=09=09break;
> +=09=09=09case 2:
> +=09=09=09=09set_fan_pwm_curve(hdev, fan_data,
> +=09=09=09=09=09=09  default_curve);
> +=09=09=09=09break;

Shouldn't this return -EINVAL in the default branch of 'switch(val)'?


> +=09=09=09}
> +=09=09=09break;
> +=09=09default:
> +=09=09=09return -EINVAL;
> +=09=09}
> +=09=09goto exit;
> +=09default:
> +=09=09return -EINVAL;
> +=09}
> +
> +cleanup:
> +=09up(&hdev->limit_sem);
> +cleanup_interface:
> +=09usb_autopm_put_interface(hdev->interface);
> +exit:
> +=09return retval;
> +}
> [...]
> +static void hwmon_init(struct hydro_i_pro_device *hdev)
> +{
> +=09int fan_id;
> +=09struct device *hwmon_dev;
> +=09struct hwmon_fan_data *fan;
> +=09struct hwmon_data *data =3D devm_kzalloc(
> +=09=09&hdev->udev->dev, sizeof(struct hwmon_data), GFP_KERNEL);
> +=09struct hwmon_chip_info *hwmon_info =3D devm_kzalloc(
> +=09=09&hdev->udev->dev, sizeof(struct hwmon_chip_info), GFP_KERNEL);

Sometimes you use 'sizeof(type)', sometimes 'sizeof(*variable)', please be =
consistent.


> +
> +=09data->channel_count =3D hdev->config->fancount;
> +=09data->channel_data =3D
> +=09=09devm_kzalloc(&hdev->udev->dev,
> +=09=09=09     sizeof(char *) * data->channel_count, GFP_KERNEL);

This should be 'sizeof(fan)' or 'sizeof(struct hwmon_fan_data*)', no?


> +
> +=09/* For each fan create a data channel a fan config entry and a pwm co=
nfig entry */
> +=09for (fan_id =3D 0; fan_id <=3D data->channel_count; fan_id++) {
> +=09=09fan =3D devm_kzalloc(&hdev->udev->dev,
> +=09=09=09=09   sizeof(struct hwmon_fan_data), GFP_KERNEL);
> +=09=09fan->fan_channel =3D fan_id;
> +=09=09fan->mode =3D 2;

Can't it be queried what the mode actually is?


> +=09=09data->channel_data[fan_id] =3D fan;
> +=09}

The loop overflows 'data->channel_data' by one element.


> +
> +=09hwmon_info->ops =3D &i_pro_ops;
> +=09hwmon_info->info =3D hdev->config->hwmon_info;
> +
> +=09data->hdev =3D hdev;
> +=09hwmon_dev =3D devm_hwmon_device_register_with_info(
> +=09=09&hdev->udev->dev, "driver_fan", data, hwmon_info, NULL);

Personally, I'd choose a different name, since "driver_fan" is not really
descriptive.


> +=09dev_info(&hdev->udev->dev, "[*] Setup hwmon\n");
> +}
> +
> +/*
> + * Devices that work with this driver.
> + * More devices should work, however none have been tested.
> + */
> +static const struct usb_device_id astk_table[] =3D {
> +=09{ USB_DEVICE(0x1b1c, 0x0c15) },

Personally, I'd create constant, something like "USB_VENDOR_ID_CORSAIR" and=
 use that here.
Possibly the same for the product id.


> +=09{},
> +};
> +
> +MODULE_DEVICE_TABLE(usb, astk_table);
> +
> +static int init_device(struct usb_device *udev)
> +{
> +=09int retval;
> +
> +=09/*
> +=09 * This is needed because when running windows in a vm with proprieta=
ry driver
> +=09 *and you switch to this driver, the device will not respond unless y=
ou run this.
          ^
Very nitpicky, but a space is missing there.


> +=09 */
> +=09retval =3D usb_control_msg(udev, usb_sndctrlpipe(udev, 0), 0x00, 0x40=
,
> +=09=09=09=09 0xffff, 0x0000, 0, 0, 0);
> +=09/*this always returns error*/
> +=09if (retval)
> +=09=09;
> +
> +=09retval =3D usb_control_msg(udev, usb_sndctrlpipe(udev, 0), 0x02, 0x40=
,
> +=09=09=09=09 0x0002, 0x0000, 0, 0, 0);
> +=09return retval;
> +}
> +
> +static int deinit_device(struct usb_device *udev)
> +{
> +=09return usb_control_msg(udev, usb_sndctrlpipe(udev, 0), 0x02, 0x40,
> +=09=09=09       0x0004, 0x0000, 0, 0, 0);
> +}
> +
> +static void astk_delete(struct hydro_i_pro_device *hdev)
> +{
> +=09usb_put_intf(hdev->interface);
> +=09usb_put_dev(hdev->udev);
> +=09kfree(hdev->bulk_in_buffer);
> +=09kfree(hdev->bulk_out_buffer);
> +=09kfree(hdev);
> +}
> +
> +static int astk_probe(struct usb_interface *interface,
> +=09=09      const struct usb_device_id *id)
> +{
> +=09struct hydro_i_pro_device *hdev;
> +=09int retval;
> +=09struct usb_endpoint_descriptor *bulk_in, *bulk_out;
> +
> +=09hdev =3D kzalloc(sizeof(*hdev), GFP_KERNEL);
> +=09if (!hdev) {
> +=09=09retval =3D -ENOMEM;
> +=09=09goto exit;
> +=09}
> +
> +=09hdev->config =3D get_device_configuration(id->idVendor, id->idProduct=
);
> +=09if (hdev->config =3D=3D NULL) {
> +=09=09retval =3D -ENOMEM;
> +=09=09goto exit;
> +=09}
> +
> +=09retval =3D usb_find_common_endpoints(interface->cur_altsetting, &bulk=
_in,
> +=09=09=09=09=09   &bulk_out, NULL, NULL);
> +=09if (retval)
> +=09=09goto exit;

If this 'if' is taken, then 'hdev' is not freed.


> +
> +=09hdev->udev =3D usb_get_dev(interface_to_usbdev(interface));
> +=09hdev->interface =3D usb_get_intf(interface);
> +
> +=09/*
> +=09 * set up the endpoint information
> +=09 * use only the first bulk-in and bulk-out endpoints
> +=09 */
> +=09hdev->bulk_in_size =3D usb_endpoint_maxp(bulk_in);
> +=09hdev->bulk_in_buffer =3D kmalloc(hdev->bulk_in_size, GFP_KERNEL);
> +=09hdev->bulk_in_endpointAddr =3D bulk_in->bEndpointAddress;
> +=09hdev->bulk_out_size =3D usb_endpoint_maxp(bulk_out);
> +=09hdev->bulk_out_buffer =3D kmalloc(hdev->bulk_out_size, GFP_KERNEL);
> +=09hdev->bulk_out_endpointAddr =3D bulk_out->bEndpointAddress;
> +
> +=09retval =3D init_device(hdev->udev);
> +=09if (retval) {
> +=09=09dev_err(&interface->dev, "failed initialising this device.\n");
> +=09=09goto exit;

Same here, 'hdev' is not freed.


> +=09}
> +
> +=09hwmon_init(hdev);
> +
> +=09usb_set_intfdata(interface, hdev);
> +=09sema_init(&hdev->limit_sem, 8);
> +exit:
> +=09return retval;
> +}
> +
> +static void astk_disconnect(struct usb_interface *interface)
> +{
> +=09struct hydro_i_pro_device *hdev =3D usb_get_intfdata(interface);
> +
> +=09dev_info(&hdev->udev->dev, "[*] DEINIT DEVICE\n");

In my opinion the style of the log messages is not consistent,
sometimes you use all-caps, sometimes it's all lowercase, sometimes
it has punctuation.


> +=09usb_set_intfdata(interface, NULL);
> +=09astk_delete(hdev);
> +=09deinit_device(hdev->udev);

At this point 'hdev' is already freed, and 'hdev->udev' is already "put".
Yet both are used.


> +}
> [...]
> +static int __init hydro_i_pro_init(void)
> +{
> +=09return usb_register(&hydro_i_pro_driver);
> +}
> +
> +static void __exit hydro_i_pro_exit(void)
> +{
> +=09usb_deregister(&hydro_i_pro_driver);
> +}
> +
> +module_init(hydro_i_pro_init);
> +module_exit(hydro_i_pro_exit);

Any reason for not using the module_usb_driver() macro?


> [...]


Barnab=C3=A1s P=C5=91cze
