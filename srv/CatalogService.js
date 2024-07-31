module.exports=cds.service.impl(async function(){
    const {POs} = this.entities;
    
    this.on('boost',async (req)=>{

        try {
            const ID = req.params[0];
           // const tx = cds.tx(req);
           cds.tx(async ()=>{
            await UPDATE(POs,ID).with({
                GROSS_AMOUNT : { "+=" : 20000}
            })

           })
            // await tx.update(POs).with({
               
            // }).where(ID)
        } catch (error) {
            return 'Error'+error.toString();
        }
       
    })

    this.on('largestOrder',async (req)=>{

        // const tx = cds.tx(req);
        
        // const recordData = await cds.tx(async ()=>{
        //   const recordData =  await SELECT.from(POs).orderBy({GROSS_AMOUNT:'desc'}).limit(1)
        // })
        // return recordData;
        const recordData = await cds.run(SELECT.from(POs).orderBy({GROSS_AMOUNT:'desc'}).limit(1));
        return recordData;
        // const  recordData = await tx.read(POs).orderBy({
        //     GROSS_AMOUNT:'desc'
        // }).limit(1)
    })
});


