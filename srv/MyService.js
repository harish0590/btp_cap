module.exports=(srv)=>{

    srv.on('pokymon',async (req)=>{

        return `Hello ${req.data.name}`
    })
}